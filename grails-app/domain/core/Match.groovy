package core

class Match {

	String name 
	String home
	String away
	Date belongDate
	
	static hasMany = [commentators: Commentator, matchFeedbacks: MatchFeedback]

	static constraints = {
		name nullable: true
		home nullable: false
		away nullable: false
		belongDate nullable:false
	}

}