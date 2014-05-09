package core 


class MatchFeedback {

	Integer score = 0
	String comment 

	Date dateCreated
	Date lastUpdated

	static belongsTo = [match: Match]

	static constraints = {
		score nullable: true
		comment nullable:false
	}

	static mapping = {
  	autoTimestamp true
  }

}