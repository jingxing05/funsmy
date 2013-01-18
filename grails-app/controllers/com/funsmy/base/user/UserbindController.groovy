package com.funsmy.base.user

import org.springframework.dao.DataIntegrityViolationException
/**
 * 在这描述该控制器 主要内容
 * @author qingfeng
 * modify log:
 */
class UserbindController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	/**
	 * 默认跳到Userbind列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def index() {
        redirect action: 'list', params: params
    }

	/**
	 * Userbind列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userbindInstanceList: Userbind.list(params), userbindInstanceTotal: Userbind.count()]
    }

	/**
	 * 新建Userbind
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def create() {
		switch (request.method) {
		case 'GET':
        	[userbindInstance: new Userbind(params)]
			break
		case 'POST':
	        def userbindInstance = new Userbind(params)
	        if (!userbindInstance.save(flush: true)) {
	            render view: 'create', model: [userbindInstance: userbindInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'userbind.label', default: 'Userbind'), userbindInstance.id])
	        redirect action: 'show', id: userbindInstance.id
			break
		}
    }

	/**
	 * 查看一个Userbind详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def show() {
        def userbindInstance = Userbind.get(params.id)
        if (!userbindInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
            redirect action: 'list'
            return
        }

        [userbindInstance: userbindInstance]
    }

	/**
	 * 编辑Userbind
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def edit() {
		switch (request.method) {
		case 'GET':
	        def userbindInstance = Userbind.get(params.id)
	        if (!userbindInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [userbindInstance: userbindInstance]
			break
		case 'POST':
	        def userbindInstance = Userbind.get(params.id)
	        if (!userbindInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (userbindInstance.version > version) {
	                userbindInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'userbind.label', default: 'Userbind')] as Object[],
	                          "Another user has updated this Userbind while you were editing")
	                render view: 'edit', model: [userbindInstance: userbindInstance]
	                return
	            }
	        }

	        userbindInstance.properties = params

	        if (!userbindInstance.save(flush: true)) {
	            render view: 'edit', model: [userbindInstance: userbindInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'userbind.label', default: 'Userbind'), userbindInstance.id])
	        redirect action: 'show', id: userbindInstance.id
			break
		}
    }

	
	/**
	 * 删除一个Userbind详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def delete() {
        def userbindInstance = Userbind.get(params.id)
        if (!userbindInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
            redirect action: 'list'
            return
        }

        try {
            userbindInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userbind.label', default: 'Userbind'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
