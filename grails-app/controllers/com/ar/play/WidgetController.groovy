package com.ar.play

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WidgetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Widget.list(params), model:[widgetInstanceCount: Widget.count()]
    }
    
    def config(PreviewTemplate previewTemplateInstance){
        println "pt"  + previewTemplateInstance.name
        // respond new PreviewTemplate(previewTemplateInstance.params)
        def templateInstance = Template.findByPreviewTemplate(previewTemplateInstance)
       def widgets = Widget.findByPreviewTemplate(previewTemplateInstance)
       render (view:'config', model: [widgets:widgets,previewTemplateInstance:previewTemplateInstance, templateInstance: templateInstance ])
    }

    def addWidget(PreviewTemplate previewTemplateInstance){
        if(previewTemplateInstance){
            def widgetInstance = new Widget()
            render (view:'addWidget', model: [widgetInstance:widgetInstance, previewTemplateInstance:previewTemplateInstance])
        }
        
    }
   
    
      def passToProd(Template template){
         if (template == null) {
            notFound()
            return
        }

        if (template.hasErrors()) {
            respond template.errors, view:'edit'
            return
            }
            template.enabled = true
            template.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Widget.label', default: 'Widget'), widgetInstance.id])
                redirect (controller:"template",action:"index")
            }
            '*'{ respond widgetInstance, [status: OK] }
        }
     }
   
    def show(Widget widgetInstance) {
        respond widgetInstance
    }

    def create() {
        respond new Widget(params)
    }

    @Transactional
    def save(Widget widgetInstance) {
        if (widgetInstance == null) {
            notFound()
            return
        }

        if (widgetInstance.hasErrors()) {
            respond widgetInstance.errors, view:'create'
            return
        }

        widgetInstance.save flush:true
        
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'widgetInstance.label', default: 'Widget'), widgetInstance.id])
                redirect widgetInstance
            }
            '*' { respond widgetInstance, [status: CREATED] }
        }
    }

    def edit(Widget widgetInstance) {
        respond widgetInstance
    }
    
     def editYoutube(Widget widgetInstance) {
        respond widgetInstance
    }

       @Transactional
    def updateYoutube(Widget widgetInstance) {
        if (widgetInstance == null) {
            notFound()
            return
        }

        if (widgetInstance.hasErrors()) {
            respond widgetInstance.errors, view:'edit'
            return
        }

        widgetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Widget.label', default: 'Widget'), widgetInstance.id])
                redirect (action:"config", id:widgetInstance.previewTemplate.id)
            }
            '*'{ respond widgetInstance, [status: OK] }
        }
    }

    @Transactional
    def update(Widget widgetInstance) {
        if (widgetInstance == null) {
            notFound()
            return
        }

        if (widgetInstance.hasErrors()) {
            respond widgetInstance.errors, view:'edit'
            return
        }

        widgetInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Widget.label', default: 'Widget'), widgetInstance.id])
                redirect widgetInstance
            }
            '*'{ respond widgetInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Widget widgetInstance) {

        if (widgetInstance == null) {
            notFound()
            return
        }

        widgetInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Widget.label', default: 'Widget'), widgetInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'widgetInstance.label', default: 'Widget'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
