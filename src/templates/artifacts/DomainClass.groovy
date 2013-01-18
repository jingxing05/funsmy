@artifact.package@class @artifact.name@ {
	/**
	 * 在这描述该领域类的主要内容
	 * @author qingfeng
	 * modify log:
	 */
	//基本字段
	//String name //名称
	
	//字段约束
    static constraints = {
		//name(nullable: false, blank: false, unique: true,email:true,size:1..50)
    }
	
	//关系映射
	//static hasMany =[ objs : Obj, ..]
	//static belongsTo =[ objs : Obj, ..]
	
	/**
	 * 对象显示为字符串
	 * @author qingfeng
	 */
	String toString(){
		// TODO: make me interesting
	}
	
	
	/**
	 * 方法描述
	 * @author qingfeng
	 * modify log:
	 * 
	 */
	String doSomething(){
		// TODO: make me interesting
	}
	
	
	
}
