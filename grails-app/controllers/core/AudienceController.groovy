package core 

class AudienceController {

	def index = {
		reidrect(action:"commentators")	
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
		}
		try {
			
		}
		catch(Exception e) {
			
		}
		
		def commentator = Commentator.get(params.id)
	}

}