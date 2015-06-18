package reportoptimization

class Builder {

    static hasMany = [tracts: Tract]
	
    static constraints = {
		code(nullable: false, blank: false)
		tracts(nullable: true, blank: true)
    }
	
	String code
	
}
