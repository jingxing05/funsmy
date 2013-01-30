package wish

import org.springframework.dao.DataIntegrityViolationException

class WishController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wishInstanceList: Wish.list(params), wishInstanceTotal: Wish.count()]
    }

    def create() {
        [wishInstance: new Wish(params)]
    }

    def save() {
        def wishInstance = new Wish(params)
        if (!wishInstance.save(flush: true)) {
            render(view: "create", model: [wishInstance: wishInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def show(Long id) {
        def wishInstance = Wish.get(id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance]
    }

    def edit(Long id) {
        def wishInstance = Wish.get(id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance]
    }

    def update(Long id, Long version) {
        def wishInstance = Wish.get(id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wishInstance.version > version) {
                wishInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wish.label', default: 'Wish')] as Object[],
                          "Another user has updated this Wish while you were editing")
                render(view: "edit", model: [wishInstance: wishInstance])
                return
            }
        }

        wishInstance.properties = params

        if (!wishInstance.save(flush: true)) {
            render(view: "edit", model: [wishInstance: wishInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def delete(Long id) {
        def wishInstance = Wish.get(id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "list")
            return
        }

        try {
            wishInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), id])
            redirect(action: "show", id: id)
        }
    }
}
