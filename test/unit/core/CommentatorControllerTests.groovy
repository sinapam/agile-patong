package core



import org.junit.*
import grails.test.mixin.*

@TestFor(CommentatorController)
@Mock(Commentator)
class CommentatorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/commentator/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.commentatorInstanceList.size() == 0
        assert model.commentatorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.commentatorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.commentatorInstance != null
        assert view == '/commentator/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/commentator/show/1'
        assert controller.flash.message != null
        assert Commentator.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/commentator/list'

        populateValidParams(params)
        def commentator = new Commentator(params)

        assert commentator.save() != null

        params.id = commentator.id

        def model = controller.show()

        assert model.commentatorInstance == commentator
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/commentator/list'

        populateValidParams(params)
        def commentator = new Commentator(params)

        assert commentator.save() != null

        params.id = commentator.id

        def model = controller.edit()

        assert model.commentatorInstance == commentator
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/commentator/list'

        response.reset()

        populateValidParams(params)
        def commentator = new Commentator(params)

        assert commentator.save() != null

        // test invalid parameters in update
        params.id = commentator.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/commentator/edit"
        assert model.commentatorInstance != null

        commentator.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/commentator/show/$commentator.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        commentator.clearErrors()

        populateValidParams(params)
        params.id = commentator.id
        params.version = -1
        controller.update()

        assert view == "/commentator/edit"
        assert model.commentatorInstance != null
        assert model.commentatorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/commentator/list'

        response.reset()

        populateValidParams(params)
        def commentator = new Commentator(params)

        assert commentator.save() != null
        assert Commentator.count() == 1

        params.id = commentator.id

        controller.delete()

        assert Commentator.count() == 0
        assert Commentator.get(commentator.id) == null
        assert response.redirectedUrl == '/commentator/list'
    }
}
