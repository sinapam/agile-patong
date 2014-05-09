package core

import org.springframework.dao.DataIntegrityViolationException

class FootballMatchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [footballMatchInstanceList: FootballMatch.list(params), footballMatchInstanceTotal: FootballMatch.count()]
    }

    def create() {
        [footballMatchInstance: new FootballMatch(params)]
    }

    def save() {
        def footballMatchInstance = new FootballMatch(params)
        if (!footballMatchInstance.save(flush: true)) {
            render(view: "create", model: [footballMatchInstance: footballMatchInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), footballMatchInstance.id])
        redirect(action: "show", id: footballMatchInstance.id)
    }

    def show(Long id) {
        def footballMatchInstance = FootballMatch.get(id)
        if (!footballMatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "list")
            return
        }

        [footballMatchInstance: footballMatchInstance]
    }

    def edit(Long id) {
        def footballMatchInstance = FootballMatch.get(id)
        if (!footballMatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "list")
            return
        }

        [footballMatchInstance: footballMatchInstance]
    }

    def update(Long id, Long version) {
        def footballMatchInstance = FootballMatch.get(id)
        if (!footballMatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (footballMatchInstance.version > version) {
                footballMatchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'footballMatch.label', default: 'FootballMatch')] as Object[],
                          "Another user has updated this FootballMatch while you were editing")
                render(view: "edit", model: [footballMatchInstance: footballMatchInstance])
                return
            }
        }

        footballMatchInstance.properties = params

        if (!footballMatchInstance.save(flush: true)) {
            render(view: "edit", model: [footballMatchInstance: footballMatchInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), footballMatchInstance.id])
        redirect(action: "show", id: footballMatchInstance.id)
    }

    def delete(Long id) {
        def footballMatchInstance = FootballMatch.get(id)
        if (!footballMatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "list")
            return
        }

        try {
            footballMatchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'footballMatch.label', default: 'FootballMatch'), id])
            redirect(action: "show", id: id)
        }
    }
}
