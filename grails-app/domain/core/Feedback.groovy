package core 


class Feedback {

	Integer score = 0
	String comment 

	Date dateCreated
	Date lastUpdated

	static belongsTo = [commentator: Commentator]

	static constraints = {
		score nullable: true
		comment nullable:false
	}

	static mapping = {
        autoTimestamp false
    }


}