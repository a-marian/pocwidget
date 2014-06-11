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
       
    
     def configFrontend (){
        respond new Template(params)
    }
    
    def saveConfigFronted (String name){
        println "namePV" + name
        if (name == ""){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templateInstance.label', default: 'Template'), params.id])
            redirect action: "configFrontend"
            return
        }
        def templateInstance = Template.findByName(name)
         if (templateInstance != null) {             
                templateInstance.enabled = false
                templateInstance.save flush:true
                println "pv chosen " + templateInstance
                redirect (action:'config', id:templateInstance.id)            
                //redirect(action: "show", id: 4, params: [author: "Stephen King"])
        }else{
              def tpl = new Template()
                tpl.name = name
                tpl.enabled = false
                tpl.previewTemplate = new PreviewTemplate(name:name, chosen:true)
                tpl.save flush:true
               println "pv chosen " + tpl
               println "template" + tpl.previewTemplate.name
                 redirect ( action:'config', id:tpl.id)
               
        }
        
    }
    
        
    def config(Template templateInstance){
        println "pt"  + templateInstance.name
        // respond new PreviewTemplate(previewTemplateInstance.params)
        //def templateInstance = Template.findByPreviewTemplate(previewTemplateInstance)
       def widgets = Widget.findByTemplate(templateInstance)
       render (view:'config', model: [widgets:widgets,templateInstance:templateInstance])
    }

    def addWidget(Template templateInstance){
        if(templateInstance){
            def widgetInstance = new Widget()
            render (view:'addWidget', model: [widgetInstance:widgetInstance, templateInstance:templateInstance])
        }
        
    }

    
      def passToProd(Template templateInstance){
          println "pasando a produccion"  + templateInstance.name 
         if (templateInstance == null) {
              println "no pasa naranja"
            notFound()
            return
        }
         def templateEnabled = Template.findAllByEnabled(true)
              templateEnabled?.each { tpl ->
          	tpl.enabled = false
                tpl.save(flush:true)
			} 
          templateInstance.enabled = true
          templateInstance.save flush:true
          //poner en false los demas templates                     
              
			
          println "template for production" + templateInstance.name
        redirect (controller: "template", action:"index")
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
