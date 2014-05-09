package core 

class MatchViewController {

	def index = {
		redirect(action:"list")	
	}

	def list = {
		def matchs = FootballMatch.withCriteria {
			order("belongDate", "desc")
			order("id", "desc")
		}
		[matchs: matchs]
	}

	def show = {
		if(!params.id){
			flash.message =  message(code:"parameter.notfound")
			flash.css = "error"
			redirect(action:"list")
		}
		try {
			def match = FootballMatch.get(params.id as Long)
			def countLike = MatchFeedback.withCriteria {
				eq("match", match)
				eq("score", 1)
			}
			def countDisLike = MatchFeedback.withCriteria {
				eq("match", match)
				eq("score", -1)
			}
			def feedbacks = MatchFeedback.withCriteria {
				eq("match", match)
				order("id", "desc")
			}
			def commentators = match.commentators
			[match: match, feedbacks: feedbacks, countLike: countLike.size(), countDisLike: countDisLike.size()]
		}
		catch(Exception e) {
			flash.message = message(code:"commentator.notfound")
			flash.css = "error"
			redirect(action:"list")
		}		
	}

	def addFeedback = {
		if(!params.id){
			flash.message = message(code:"parameter.notfound")
			flash.css = "error"
			redirect(action:"list")
		}
		def match
		try {
			match = FootballMatch.get(params.id as Long)
			def feedback = new MatchFeedback(score: (params.score ), match: match, comment:params.comment)
			
			if(feedback.save(flush:true)){
				flash.message = message(code:"feedback.add.success")
				flash.css = "info"
				redirect(action:"show",id: params.id)
			}else{
				flash.message = message(code:"feedback.add.error")
				flash.css = "error"
				redirect(action:"show",id: params.id)
			}
		}
		catch(Exception e) {
			flash.message =  message(code:"commentator.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}	
	}
}