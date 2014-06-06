package com.ar.play

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def videoWidget= new Video()
      def templateInstance = Template.findByEnabled(true)      
      if (templateInstance != null){
        // widgetVideo = Widget.findByType('video')
           templateInstance.widgets?.each{ widget ->
			   println "user" +  widget
			   if(widget.type == "video"){
                               videoWidget = widget
                               println "plataforma" + videoWidget.platform
                           }                           
            }
          
          //def widget =  ? Book.findAllByAuthor(author) : []
          println "template" + templateInstance.name
          
      }
      render ( model:[templateInstance:templateInstance, videoWidget:videoWidget], view:"index" )
    }

    def list (Integer max){
        params.max = Math.min(max ?: 10, 100)
        respond Template.list(params), model:[templateInstanceCount: Template.count()]
    }
    
    
    def changeEnabledState = {
		def templateInstance = Template.get(params.id)
		println "tpl" + templateInstance
		if (!templateInstance){
			flash.message = "Template not found"
			redirect(action: "list")
		}else {
			 if(templateInstance.enabled == true){
				  templateInstance.enabled = false
				 flash.message = "${templateInstance.id} is disabled"
				 }else{
				 flash.message = "${templateInstance.id} is enabled"
			    	templateInstance.enabled = true
					}
				 templateInstance.save(flush:true)
				 println "changeStateTemplate"
                                 redirect(action: "list")
			 }
    }
    
    def show(Template templateInstance) {
        respond templateInstance
    }

    def create() {
        respond new Template(params)
    }

    @Transactional
    def save(Template templateInstance) {
        if (templateInstance == null) {
            notFound()
            return
        }

        if (templateInstance.hasErrors()) {
            respond templateInstance.errors, view:'create'
            return
        }

        templateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'templateInstance.label', default: 'Template'), templateInstance.id])
                redirect templateInstance
            }
            '*' { respond templateInstance, [status: CREATED] }
        }
    }

    def edit(Template templateInstance) {
        respond templateInstance
    }

    @Transactional
    def update(Template templateInstance) {
        if (templateInstance == null) {
            notFound()
            return
        }

        if (templateInstance.hasErrors()) {
            respond templateInstance.errors, view:'edit'
            return
        }

        templateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Template.label', default: 'Template'), templateInstance.id])
                redirect templateInstance
            }
            '*'{ respond templateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Template templateInstance) {

        if (templateInstance == null) {
            notFound()
            return
        }

        templateInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Template.label', default: 'Template'), templateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateInstance.label', default: 'Template'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
