package reportoptimization

class Region {
	
	static hasMany = [builders: Builder]
	
    static constraints = {
		name (nullable: true, blank: true)
		drive (nullable: false, blank: false)
		builders(nullable: true, blank: true)
    }
	
	String name
	String drive
}
