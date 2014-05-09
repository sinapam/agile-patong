package core 


class Feedback {

	Integer score = 0
	String comment 

	static belongsTo = [commentator: Commentator]

	static constraints = {
		score nullable: true
		comment nullable:false
	}


}