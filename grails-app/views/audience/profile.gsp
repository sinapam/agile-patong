<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="audience">
		<g:set var="entityName" value="${message(code: 'commentator.label', default: 'Commentator')}" />
		<title></title>
	</head>
	<body>
		<h3>${commentator?.name}</h3>
		<div class="row">
			<div class="col-md-4">
				
					<span class="big"> Like : </span><span class="like-count">3021</span>
					<span class="big"> Dislike : </span><span class="dislike-count">221</span>
				
			</div>
			<div class="col-md-8 ">
				<h4>Comments</h4>
				<g:form action="addFeedback" id="${commentator.id}" >
				<div class="btn-group like-group" data-toggle="buttons">
  <label class="btn btn-default">
    <input type="radio" name="score" id="option1" value="1"> Like
  </label>
  <label class="btn btn-default">
    <input type="radio" name="score" id="option2" value-"-1"> Dislike
  </label>
 
</div>
				<g:textArea class="form-control" rows="3" name="comment" />
				<g:submitButton name="submit" class="btn btn-primary submit" value="submit" />
				</g:form>
				<hr/>
			</div>



		</div>
			

			<style type="text/css">
				.bordered-box{
					min-height: 400px;
					border: 1px solid #ccc;
				}
				.info-box{
					border: 1px solid #ccc;	
					padding: 10px;				
				}

				.like-count{
					color : #5cb85c;;
					font-size: 20px;
				}
				.like-group{
					margin: 10px 0px;
				}

				.dislike-count {
					color : #d9534f;;
					font-size: 20px;
				}

				.submit{
					margin:10px 0px;
				}

				.big{
					font-size: 20px;
				}

			</style>
	</body>
</html>
