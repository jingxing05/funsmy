package wish

import org.springframework.dao.DataIntegrityViolationException

class NewlywedsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [newlywedsInstanceList: Newlyweds.list(params), newlywedsInstanceTotal: Newlyweds.count()]
    }

    def create() {
        [newlywedsInstance: new Newlyweds(params)]
    }

    def save() {
        def newlywedsInstance = new Newlyweds(params)
        if (!newlywedsInstance.save(flush: true)) {
            render(view: "create", model: [newlywedsInstance: newlywedsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), newlywedsInstance.id])
        redirect(action: "show", id: newlywedsInstance.id)
    }

    def show(Long id) {
        def newlywedsInstance = Newlyweds.get(id)
        if (!newlywedsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "list")
            return
        }

        [newlywedsInstance: newlywedsInstance]
    }

    def edit(Long id) {
        def newlywedsInstance = Newlyweds.get(id)
        if (!newlywedsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "list")
            return
        }

        [newlywedsInstance: newlywedsInstance]
    }

    def update(Long id, Long version) {
        def newlywedsInstance = Newlyweds.get(id)
        if (!newlywedsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (newlywedsInstance.version > version) {
                newlywedsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'newlyweds.label', default: 'Newlyweds')] as Object[],
                          "Another user has updated this Newlyweds while you were editing")
                render(view: "edit", model: [newlywedsInstance: newlywedsInstance])
                return
            }
        }

        newlywedsInstance.properties = params

        if (!newlywedsInstance.save(flush: true)) {
            render(view: "edit", model: [newlywedsInstance: newlywedsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), newlywedsInstance.id])
        redirect(action: "show", id: newlywedsInstance.id)
    }

    def delete(Long id) {
        def newlywedsInstance = Newlyweds.get(id)
        if (!newlywedsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "list")
            return
        }

        try {
            newlywedsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'newlyweds.label', default: 'Newlyweds'), id])
            redirect(action: "show", id: id)
        }
    }
}
