modules = {
    application {
        resource url:'js/application.js'
    }

    bootstrap{
    	dependsOn 'jquery'
    	resource url: 'css/bootstrap.min.css'
    	resource url: 'js/bootstrap.min.js'
    }
}