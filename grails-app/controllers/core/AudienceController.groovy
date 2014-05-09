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
			flash.message(code:"parameter.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}
		try {
			def commentator = Commentator.get(params.id as Long)
			[commentator: commentator]
		}
		catch(Exception e) {
			flash.message(code:"commentator.notfound")
			flash.css = "error"
			redirect(action:"commentators")
		}
		
	}

}