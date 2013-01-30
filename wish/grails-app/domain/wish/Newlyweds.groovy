package wish

class Newlyweds {
	String husband
	String wife
	Date weddingtime
	String address
	String memo = '欢迎大家祝福'

    static constraints = {
		husband(blank:false,size:1..20)
		wife(blank:false,size:1..20)
		weddingtime(blank:false)
		address(blank:false,size:5..100)
		memo(blank:false)
		
    }
	
	String toString(){
		return husband + ',' + wife
	}
}
