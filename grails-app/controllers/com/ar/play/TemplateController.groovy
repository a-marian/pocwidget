package com.ar.play



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def template = Template.findByEnabled(true)
        if (template){
            def youtubeWidgets = Widget.findAllByTemplateAndPublishProd(template, true)
            render(view: "index", model: [templateInstance:template, youtubeWidgets:youtubeWidgets])
            }
       
       }
       
   
    
    def list(Integer max){
           params.max = Math.min(max ?: 10, 100)
        respond Template.list(params), model:[templateInstanceCount: Template.count()]
  
    }
    
    def changeEnabledState(Template template) {
          if (template == null) {
            notFound()
            return
          } else {
		if(template.enabled == true){
			  template.enabled = false
                          flash.message = "${template.id} have not been chosen"
                                 redirect (action:"index")
		 }else{
			 flash.message = "${template.id} have been chosen"
		    	 template.enabled = true
                         redirect (action:"index")
		}
		 template.save(flush:true)
		 println "changeStatePV"
	 }			
    }
    
      def passToProd(Template templateInstance){
          println "template" + templateInstance.name
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
