package com.funsmy.base.user

import org.springframework.dao.DataIntegrityViolationException
/**
 * 在这描述该控制器 主要内容
 * @author qingfeng
 * modify log:
 */
class RoleController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	/**
	 * 默认跳到Role列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def index() {
        redirect action: 'list', params: params
    }

	/**
	 * Role列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [roleInstanceList: Role.list(params), roleInstanceTotal: Role.count()]
    }

	/**
	 * 新建Role
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def create() {
		switch (request.method) {
		case 'GET':
        	[roleInstance: new Role(params)]
			break
		case 'POST':
	        def roleInstance = new Role(params)
	        if (!roleInstance.save(flush: true)) {
	            render view: 'create', model: [roleInstance: roleInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
	        redirect action: 'show', id: roleInstance.id
			break
		}
    }

	/**
	 * 查看一个Role详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def show() {
        def roleInstance = Role.get(params.id)
        if (!roleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
            redirect action: 'list'
            return
        }

        [roleInstance: roleInstance]
    }

	/**
	 * 编辑Role
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def edit() {
		switch (request.method) {
		case 'GET':
	        def roleInstance = Role.get(params.id)
	        if (!roleInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [roleInstance: roleInstance]
			break
		case 'POST':
	        def roleInstance = Role.get(params.id)
	        if (!roleInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (roleInstance.version > version) {
	                roleInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'role.label', default: 'Role')] as Object[],
	                          "Another user has updated this Role while you were editing")
	                render view: 'edit', model: [roleInstance: roleInstance]
	                return
	            }
	        }

	        roleInstance.properties = params

	        if (!roleInstance.save(flush: true)) {
	            render view: 'edit', model: [roleInstance: roleInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
	        redirect action: 'show', id: roleInstance.id
			break
		}
    }

	
	/**
	 * 删除一个Role详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def delete() {
        def roleInstance = Role.get(params.id)
        if (!roleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
            redirect action: 'list'
            return
        }

        try {
            roleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'role.label', default: 'Role'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
