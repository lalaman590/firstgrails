package grails2

class CameraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cameraInstanceList: Camera.list(params), cameraInstanceTotal: Camera.count()]
    }

    def create = {
        def cameraInstance = new Camera()
        cameraInstance.properties = params
        return [cameraInstance: cameraInstance]
    }

    def save = {
        def cameraInstance = new Camera(params)
        if (cameraInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'camera.label', default: 'Camera'), cameraInstance.id])}"
            redirect(action: "show", id: cameraInstance.id)
        }
        else {
            render(view: "create", model: [cameraInstance: cameraInstance])
        }
    }

    def show = {
        def cameraInstance = Camera.get(params.id)
        if (!cameraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cameraInstance: cameraInstance]
        }
    }

    def edit = {
        def cameraInstance = Camera.get(params.id)
        if (!cameraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cameraInstance: cameraInstance]
        }
    }

    def update = {
        def cameraInstance = Camera.get(params.id)
        if (cameraInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cameraInstance.version > version) {
                    
                    cameraInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'camera.label', default: 'Camera')] as Object[], "Another user has updated this Camera while you were editing")
                    render(view: "edit", model: [cameraInstance: cameraInstance])
                    return
                }
            }
            cameraInstance.properties = params
            if (!cameraInstance.hasErrors() && cameraInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'camera.label', default: 'Camera'), cameraInstance.id])}"
                redirect(action: "show", id: cameraInstance.id)
            }
            else {
                render(view: "edit", model: [cameraInstance: cameraInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cameraInstance = Camera.get(params.id)
        if (cameraInstance) {
            try {
                cameraInstance.delete(flush: true)
                //grails@localhost
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'camera.label', default: 'Camera'), params.id])}"
            redirect(action: "list")
        }
    }
}
