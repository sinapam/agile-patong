package core 

class AudienceController {

	def index = {
		redirect(action:"commentators")	
	}

	def commentators = {
		def commentators = Commentator.list()
		[commentators: commentators]
	}

	def matchs = {
		def matchs = Match.list()
		[matchs: matchs]
	}

	def profile = {
		if(!params.id){
			flash.message =  message(code:"parameter.notfound")
		}
		try {
			def commentator = Commentator.get(params.id as Long)
			def countLike = Feedback.withCriteria {
				eq("commentator", commentator)
				eq("score", 1)
			}
			def countDisLike = Feedback.withCriteria {
				eq("commentator", commentator)
				eq("score", -1)
			}
			def feedbacks = Feedback.withCriteria {
				eq("commentator", commentator)
			}
			[commentator: commentator, feedbacks: feedbacks, countLike: countLike.size(), countDisLike: countDisLike.size()]
		}
		catch(Exception e) {
			flash.message = message(code:"commentator.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}		
	}

	def addFeedback = {
		if(!params.id){
			flash.message = message(code:"parameter.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}
		def commentator
		try {
			commentator = Commentator.get(params.id as Long)
			def feedback = new Feedback(score: (params.score ), commentator: commentator, comment:params.comment)
			
			if(feedback.save(flush:true)){
				flash.message = message(code:"feedback.add.success")
				flash.css = "info"
				redirect(action:"profile",id:params.id)
			}else{
				flash.message = message(code:"feedback.add.error")
				flash.css = "error"
				redirect(action:"commentators")
			}
		}
		catch(Exception e) {
			flash.message =  message(code:"commentator.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}	
	}

}