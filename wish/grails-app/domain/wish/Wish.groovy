package wish

class Wish {
	String fromwho
	String toname
	String wish
	Date createTime
	
    static belongsTo = [newlyweds:Newlyweds]
    static constraints = {
		fromwho(blank:false,size:1..20)
		newlyweds(blank:false)
		toname(blank:false,size:2..40)
		wish(blank:false,size:3..140)
    }
	
	String toString(){
		return wish
	}
	
}
