@artifact.package
/**
 * 在这描述过滤器主要内容
 * @author qingfeng
 * modify log:
 */
@class @artifact.name@ {

	/**
	 * 注释注释 利人利己
	 * @author qingfeng
	 * modify log:
	 *
	 */
    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
