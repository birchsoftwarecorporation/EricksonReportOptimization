package reportoptimization

class Entry {
	
	static hasMany = [foreman: Foreman]

    static constraints = {
		type(nullable: false, blank: false)
		progressDate(nullable: false, blank: false)
		hours(nullable: true, blank: true)
		claimPercentage(nullable: true, blank: true)
		calcPercentage(nullable: true, blank: true)
		laborClaim(nullable: true, blank: true)
		laborCost(nullable: true, blank: true)
		foreman(nullable: false, blank: false)
    }
	
	String type
	Date progressDate
	Integer hours
	Integer claimPercentage
	Integer calcPercentage
	Integer laborClaim
	Integer laborCost
	
}
