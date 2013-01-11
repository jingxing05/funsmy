package com.funsmy.base.open

import org.springframework.dao.DataIntegrityViolationException
/**
 * 在这描述该控制器 主要内容
 * @author qingfeng
 * modify log:
 */
class OpenidController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	/**
	 * 默认跳到Openid列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def index() {
        redirect action: 'list', params: params
    }

	/**
	 * Openid列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [openidInstanceList: Openid.list(params), openidInstanceTotal: Openid.count()]
    }

	/**
	 * 新建Openid
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def create() {
		switch (request.method) {
		case 'GET':
        	[openidInstance: new Openid(params)]
			break
		case 'POST':
	        def openidInstance = new Openid(params)
	        if (!openidInstance.save(flush: true)) {
	            render view: 'create', model: [openidInstance: openidInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'openid.label', default: 'Openid'), openidInstance.id])
	        redirect action: 'show', id: openidInstance.id
			break
		}
    }

	/**
	 * 查看一个Openid详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def show() {
        def openidInstance = Openid.get(params.id)
        if (!openidInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
            redirect action: 'list'
            return
        }

        [openidInstance: openidInstance]
    }

	/**
	 * 编辑Openid
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def edit() {
		switch (request.method) {
		case 'GET':
	        def openidInstance = Openid.get(params.id)
	        if (!openidInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [openidInstance: openidInstance]
			break
		case 'POST':
	        def openidInstance = Openid.get(params.id)
	        if (!openidInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (openidInstance.version > version) {
	                openidInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'openid.label', default: 'Openid')] as Object[],
	                          "Another user has updated this Openid while you were editing")
	                render view: 'edit', model: [openidInstance: openidInstance]
	                return
	            }
	        }

	        openidInstance.properties = params

	        if (!openidInstance.save(flush: true)) {
	            render view: 'edit', model: [openidInstance: openidInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'openid.label', default: 'Openid'), openidInstance.id])
	        redirect action: 'show', id: openidInstance.id
			break
		}
    }

	
	/**
	 * 删除一个Openid详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def delete() {
        def openidInstance = Openid.get(params.id)
        if (!openidInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
            redirect action: 'list'
            return
        }

        try {
            openidInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'openid.label', default: 'Openid'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
