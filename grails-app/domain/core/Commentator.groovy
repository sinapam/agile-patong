package core

class Commentator {

	String name 
	String channel
	Integer age
	String detail
	String imageUrl

	static hasMany = [feedbacks: Feedback]

	static constraints = {
		name nullable: false
		channel nullable: true 
		age nullable:true 
		detail nullable:true, widget:'textarea'
		imageUrl nullable:true
	}

	static mapping = {
		detail type:'text'
	}

}