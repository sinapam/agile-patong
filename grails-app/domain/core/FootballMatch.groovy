package core

class FootballMatch {

	String name 
	String home
	String homeImage
	String away
	String awayImage
	Date belongDate
	
	static hasMany = [commentators: Commentator, matchFeedbacks: MatchFeedback]

	static constraints = {
		name nullable: true
		home nullable: false
		homeImage nullable:true
		away nullable: false
		awayImage nullable:false
		belongDate nullable:false
	}

	def displayName(){
		return "${home} vs ${away}"
	}

}