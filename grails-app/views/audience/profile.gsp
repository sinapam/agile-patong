<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="audience">
		<g:set var="entityName" value="${message(code: 'commentator.label', default: 'Commentator')}" />
		<title>${commentator?.name}</title>

		<r:require modules="chart" />
	</head>
	<body>
		
		<div class="row">
			<div class="col-md-3">
				<div class="row text-center">
				<img src="${commentator?.imageUrl}"   class="img-rounded col-md-12">
			</div>
				<h3>${commentator?.name}</h3>
				<div class="text-center">
					<span class="big"> <span class="glyphicon glyphicon-thumbs-up" ></span> : </span><span class="like-count">${countLike}</span> &nbsp;&nbsp;
					<span class="big"> <span class="glyphicon glyphicon-thumbs-down"></span> : </span><span class="dislike-count">${countDisLike}</span>

				</div>
				<div id="container" ></div>
				
				
			</div>
			<div class="col-md-9 ">
				<h4>Comments</h4>
				<g:form action="addFeedback" id="${commentator.id}" >
				<div class="btn-group like-group" data-toggle="buttons">
				  <label class="btn btn-default">
				    <input type="radio" name="score" id="option1" value="1"> Like
				  </label>
				  <label class="btn btn-default">
				    <input type="radio" name="score" id="option2" value="-1"> Dislike
				  </label>
				</div>
				<g:textArea class="form-control" rows="3" name="comment" />
				<g:submitButton name="submit" class="btn btn-primary submit" value="submit" />
				</g:form>
				<hr/>
				<g:each var="feedback" in="${feedbacks}">
					<div class="comment-box" >
						<p><g:fieldValue bean="${feedback}" field="comment"/></p>

						<small>${}</small>
					</div>

				</g:each>
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

				.comment-box{
					border:1px solid #eee;
					margin: 5px 0px;
					padding: 10px;
				}

			</style>

			<script>
			$('.btn').button();
			</script>
				<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        colors: ['#3498db','#e74c3c'],
        credits:{
        	enabled:false
        },
        title: {
            text: ''
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '{point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'RATING',
            data: [
                ['Like',   ${countLike}],
                ['Dislike',       ${countDisLike ?:0}]
                
            ]
        }]
    });
});
    

		</script>
	</body>
</html>
