<%=packageName ? "package ${packageName}\n\n" : ''%>import org.springframework.dao.DataIntegrityViolationException
/**
 * 在这描述该控制器 主要内容
 * @author qingfeng
 * modify log:
 */
class ${className}Controller {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	/**
	 * 默认跳到${className}列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def index() {
        redirect action: 'list', params: params
    }

	/**
	 * ${className}列表页
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [${propertyName}List: ${className}.list(params), ${propertyName}Total: ${className}.count()]
    }

	/**
	 * 新建${className}
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def create() {
		switch (request.method) {
		case 'GET':
        	[${propertyName}: new ${className}(params)]
			break
		case 'POST':
	        def ${propertyName} = new ${className}(params)
	        if (!${propertyName}.save(flush: true)) {
	            render view: 'create', model: [${propertyName}: ${propertyName}]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
	        redirect action: 'show', id: ${propertyName}.id
			break
		}
    }

	/**
	 * 查看一个${className}详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def show() {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
            redirect action: 'list'
            return
        }

        [${propertyName}: ${propertyName}]
    }

	/**
	 * 编辑${className}
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def edit() {
		switch (request.method) {
		case 'GET':
	        def ${propertyName} = ${className}.get(params.id)
	        if (!${propertyName}) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [${propertyName}: ${propertyName}]
			break
		case 'POST':
	        def ${propertyName} = ${className}.get(params.id)
	        if (!${propertyName}) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (${propertyName}.version > version) {<% def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className) %>
	                ${propertyName}.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: '${domainClass.propertyName}.label', default: '${className}')] as Object[],
	                          "Another user has updated this ${className} while you were editing")
	                render view: 'edit', model: [${propertyName}: ${propertyName}]
	                return
	            }
	        }

	        ${propertyName}.properties = params

	        if (!${propertyName}.save(flush: true)) {
	            render view: 'edit', model: [${propertyName}: ${propertyName}]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}.id])
	        redirect action: 'show', id: ${propertyName}.id
			break
		}
    }

	
	/**
	 * 删除一个${className}详情
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def delete() {
        def ${propertyName} = ${className}.get(params.id)
        if (!${propertyName}) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
            redirect action: 'list'
            return
        }

        try {
            ${propertyName}.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
