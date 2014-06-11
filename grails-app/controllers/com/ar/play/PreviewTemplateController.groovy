package com.ar.play


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.ar.play.Template

@Transactional(readOnly = true)
class PreviewTemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PreviewTemplate.list(params), model:[previewTemplateInstanceCount: PreviewTemplate.count()]
    }
    
    
   /* def configFrontend (){
        respond new PreviewTemplate(params)
    }
    
    def saveConfigFronted (String name){
        println "namePV" + name
        if (name == ""){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'previewTemplateInstance.label', default: 'PreviewTemplate'), params.id])
            redirect action: "configFrontend"
            return
        }
        def previewTemplateInstance = PreviewTemplate.findByName(name)
         if (previewTemplateInstance != null) {             
                previewTemplateInstance.chosen = true
                previewTemplateInstance.save flush:true
                println "pv chosen " + previewTemplateInstance
                redirect (action:'config', id:previewTemplateInstance.id)            
                //redirect(action: "show", id: 4, params: [author: "Stephen King"])
        }else{
              def pvt = new PreviewTemplate()
                pvt.name = name
                pvt.chosen = true
                pvt.template = new Template(name:name, enabled:false)
                pvt.save flush:true
               println "pv chosen " + pvt
               println "template" + pvt.template.name
                 redirect ( action:'config', id:pvt.id)
               
        }
        
    }
    
        
    def config(PreviewTemplate previewTemplateInstance){
        println "pt"  + previewTemplateInstance.name
        // respond new PreviewTemplate(previewTemplateInstance.params)
        //def templateInstance = Template.findByPreviewTemplate(previewTemplateInstance)
       def widgets = Widget.findByPreviewTemplate(previewTemplateInstance)
       render (view:'config', model: [widgets:widgets,previewTemplateInstance:previewTemplateInstance])
    }

    def addWidget(PreviewTemplate previewTemplateInstance){
        if(previewTemplateInstance){
            def widgetInstance = new Widget()
            render (view:'addWidget', model: [widgetInstance:widgetInstance, previewTemplateInstance:previewTemplateInstance])
        }
        
    }

    
      def passToProd(PreviewTemplate previewTemplateInstance){
          println "pasando a produccion"  + previewTemplateInstance.name 
         if (previewTemplateInstance == null) {
              println "no pasa naranja"
            notFound()
            return
        }
        previewTemplateInstance?.template?.enabled = true
        previewTemplateInstance.save flush:true
           println "template for production" +   previewTemplateInstance.template.name
        /*def templateInstance = Template.findByPreviewTemplate(previewTemplateInstance)
        println "template encontrado" + templateInstance.name
        
          if(templateInstance){
             templateInstance.enabled = true            
             templateInstance.save flush:true
             println "template for production" + templateInstance.name
             redirect (controller: "template", action:"index" ) }*/
        
    
    def changeEnabledState(PreviewTemplate pv) {
          if (pv == null) {
            notFound()
            return
          } else {
		if(pv.chosen == true){
			  pv.chosen = false
                          flash.message = "${pv.id} have not been chosen"
                                 redirect (action:"index")
		 }else{
			 flash.message = "${pv.id} have been chosen"
		    	 pv.chosen = true
                         redirect (action:"index")
		}
		 pv.save(flush:true)
		 println "changeStatePV"
	 }			
		}

    def show(PreviewTemplate previewTemplateInstance) {
       def youtubeWidgets = Widget.findAllByPreviewTemplate(previewTemplateInstance)
        render(view: "show", model: [previewTemplateInstance:previewTemplateInstance, youtubeWidgets:youtubeWidgets])
    }
    
    def viewPreview(PreviewTemplate previewTemplateInstance){
        println "preview" + previewTemplateInstance.name
        
    }
   
     def create() {
        respond new PreviewTemplate(params)
    }

    @Transactional
    def save(PreviewTemplate previewTemplateInstance) {
        if (previewTemplateInstance == null) {
            notFound()
            return
        }
        if (previewTemplateInstance.hasErrors()) {
            respond previewTemplateInstance.errors, view:'create'
            return
        }
        def pvnames = PreviewTemplate.findAllByName(previewTemplateInstance.name)
         if (pvnames) {
         //  flash.message = message(code: 'default.created.message', args: [message(code: 'previewTemplateInstance.label', default: 'PreviewTemplate'), previewTemplateInstance.id)
           respond previewTemplateInstance.errors, view:'create'
            return
        }
        previewTemplateInstance.chosen = false
        previewTemplateInstance.save flush:true
        def template = new Template()
        if (previewTemplateInstance){
        template.previewTemplate = previewTemplateInstance
        template.name = previewTemplateInstance.name
        template.enabled =  previewTemplateInstance.chosen
         template.save flush:true
         println "together saved"
     }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'previewTemplateInstance.label', default: 'PreviewTemplate'), previewTemplateInstance.id])
                redirect previewTemplateInstance
            }
            '*' { respond previewTemplateInstance, [status: CREATED] }
        }
    }

    def edit(PreviewTemplate previewTemplateInstance) {
        respond previewTemplateInstance
    }

    @Transactional
    def update(PreviewTemplate previewTemplateInstance) {
        if (previewTemplateInstance == null) {
            notFound()
            return
        }

        if (previewTemplateInstance.hasErrors()) {
            respond previewTemplateInstance.errors, view:'edit'
            return
        }

        previewTemplateInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PreviewTemplate.label', default: 'PreviewTemplate'), previewTemplateInstance.id])
                redirect previewTemplateInstance
            }
            '*'{ respond previewTemplateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PreviewTemplate previewTemplateInstance) {

        if (previewTemplateInstance == null) {
            notFound()
            return
        }

        previewTemplateInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PreviewTemplate.label', default: 'PreviewTemplate'), previewTemplateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'previewTemplateInstance.label', default: 'PreviewTemplate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
