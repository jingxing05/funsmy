package com.funsmy.base.user

import org.springframework.dao.DataIntegrityViolationException
/**
 * 在这描述该控制器 主要内容
 * @author qingfeng
 * modify log:
 */
class UserprofileController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	/**
	 * 默认跳到Userprofile列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def index() {
        redirect action: 'list', params: params
    }

	/**
	 * Userprofile列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userprofileInstanceList: Userprofile.list(params), userprofileInstanceTotal: Userprofile.count()]
    }

	/**
	 * 新建Userprofile
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def create() {
		switch (request.method) {
		case 'GET':
        	[userprofileInstance: new Userprofile(params)]
			break
		case 'POST':
	        def userprofileInstance = new Userprofile(params)
	        if (!userprofileInstance.save(flush: true)) {
	            render view: 'create', model: [userprofileInstance: userprofileInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), userprofileInstance.id])
	        redirect action: 'show', id: userprofileInstance.id
			break
		}
    }

	/**
	 * 查看一个Userprofile详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def show() {
        def userprofileInstance = Userprofile.get(params.id)
        if (!userprofileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
            redirect action: 'list'
            return
        }

        [userprofileInstance: userprofileInstance]
    }

	/**
	 * 编辑Userprofile
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def edit() {
		switch (request.method) {
		case 'GET':
	        def userprofileInstance = Userprofile.get(params.id)
	        if (!userprofileInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [userprofileInstance: userprofileInstance]
			break
		case 'POST':
	        def userprofileInstance = Userprofile.get(params.id)
	        if (!userprofileInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (userprofileInstance.version > version) {
	                userprofileInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'userprofile.label', default: 'Userprofile')] as Object[],
	                          "Another user has updated this Userprofile while you were editing")
	                render view: 'edit', model: [userprofileInstance: userprofileInstance]
	                return
	            }
	        }

	        userprofileInstance.properties = params

	        if (!userprofileInstance.save(flush: true)) {
	            render view: 'edit', model: [userprofileInstance: userprofileInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), userprofileInstance.id])
	        redirect action: 'show', id: userprofileInstance.id
			break
		}
    }

	
	/**
	 * 删除一个Userprofile详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def delete() {
        def userprofileInstance = Userprofile.get(params.id)
        if (!userprofileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
            redirect action: 'list'
            return
        }

        try {
            userprofileInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userprofile.label', default: 'Userprofile'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
