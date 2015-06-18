package reportoptimization

class Tract {

    static hasMany = [lots: Lot]
	
    static constraints = {
		name(nullable: false, blank: false)
    }
	
	String name
	
}
