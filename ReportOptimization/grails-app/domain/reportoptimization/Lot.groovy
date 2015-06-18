package reportoptimization

class Lot {

    static hasMany = [entries: Entry]
	
    static constraints = {
		number(nullable: false, blank: false)
		panelHours(nullable: true, blank: true)
		panelBudget(nullable: true, blank: true)
		fieldHours(nullable: true, blank: true)
		fieldBudget(nullable: true, blank: true)
		excelDoc(nullable: true, blank: true)
		path(nullable: true, blank: true)
		entries(nullable: true, blank: true)
    }
	
	Integer number
	Integer panelHours
	Integer panelBudget
	Integer fieldHours
	Integer fieldBudget
	File excelDoc
	String path
	String md5Hash
	
}
