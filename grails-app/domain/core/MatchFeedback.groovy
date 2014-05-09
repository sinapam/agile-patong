package core 


class MatchFeedback {

	Integer score = 0
	String comment 

	static belongsTo = [match: Match]

	static constraints = {
		score nullable: true
		comment nullable:false
	}


}