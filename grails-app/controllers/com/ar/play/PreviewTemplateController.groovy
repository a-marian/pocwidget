package com.ar.play


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PreviewTemplateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PreviewTemplate.list(params), model:[previewTemplateInstanceCount: PreviewTemplate.count()]
    }
    
    
    def configFrontend (Integer max){
         params.max = Math.min(max ?: 10, 100)
       render (view:'configFrontend', model:[previewTemplateInstance : PreviewTemplate.list(params)])
    }
    
    def saveConfigFronted (String name){
        println "namePV" + name
        def previewTemplateInstance = PreviewTemplate.findByName(name)
         if (previewTemplateInstance != null) {             
                previewTemplateInstance.chosen = true
                previewTemplateInstance.save flush:true
                println "pv chosen " + previewTemplateInstance
                redirect (controller: 'widget', action:'config', id:previewTemplateInstance.id)            
                //redirect(action: "show", id: 4, params: [author: "Stephen King"])
        }else{
                notFound()
                return
        }
        
    }
    
    
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
