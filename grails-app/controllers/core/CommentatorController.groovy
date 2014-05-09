package core

import org.springframework.dao.DataIntegrityViolationException

class CommentatorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [commentatorInstanceList: Commentator.list(params), commentatorInstanceTotal: Commentator.count()]
    }

    def create() {
        [commentatorInstance: new Commentator(params)]
    }

    def save() {
        def commentatorInstance = new Commentator(params)
        if (!commentatorInstance.save(flush: true)) {
            render(view: "create", model: [commentatorInstance: commentatorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'commentator.label', default: 'Commentator'), commentatorInstance.id])
        redirect(action: "show", id: commentatorInstance.id)
    }

    def show(Long id) {
        def commentatorInstance = Commentator.get(id)
        if (!commentatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "list")
            return
        }

        [commentatorInstance: commentatorInstance]
    }

    def edit(Long id) {
        def commentatorInstance = Commentator.get(id)
        if (!commentatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "list")
            return
        }

        [commentatorInstance: commentatorInstance]
    }

    def update(Long id, Long version) {
        def commentatorInstance = Commentator.get(id)
        if (!commentatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (commentatorInstance.version > version) {
                commentatorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'commentator.label', default: 'Commentator')] as Object[],
                          "Another user has updated this Commentator while you were editing")
                render(view: "edit", model: [commentatorInstance: commentatorInstance])
                return
            }
        }

        commentatorInstance.properties = params

        if (!commentatorInstance.save(flush: true)) {
            render(view: "edit", model: [commentatorInstance: commentatorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'commentator.label', default: 'Commentator'), commentatorInstance.id])
        redirect(action: "show", id: commentatorInstance.id)
    }

    def delete(Long id) {
        def commentatorInstance = Commentator.get(id)
        if (!commentatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "list")
            return
        }

        try {
            commentatorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'commentator.label', default: 'Commentator'), id])
            redirect(action: "show", id: id)
        }
    }
}
