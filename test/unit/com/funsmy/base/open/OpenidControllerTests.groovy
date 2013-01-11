package com.funsmy.base.open



import org.junit.*
import grails.test.mixin.*

@TestFor(OpenidController)
@Mock(Openid)
class OpenidControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/openid/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.openidInstanceList.size() == 0
        assert model.openidInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.openidInstance != null
    }

    void testSave() {
        controller.save()

        assert model.openidInstance != null
        assert view == '/openid/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/openid/show/1'
        assert controller.flash.message != null
        assert Openid.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/openid/list'

        populateValidParams(params)
        def openid = new Openid(params)

        assert openid.save() != null

        params.id = openid.id

        def model = controller.show()

        assert model.openidInstance == openid
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/openid/list'

        populateValidParams(params)
        def openid = new Openid(params)

        assert openid.save() != null

        params.id = openid.id

        def model = controller.edit()

        assert model.openidInstance == openid
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/openid/list'

        response.reset()

        populateValidParams(params)
        def openid = new Openid(params)

        assert openid.save() != null

        // test invalid parameters in update
        params.id = openid.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/openid/edit"
        assert model.openidInstance != null

        openid.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/openid/show/$openid.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        openid.clearErrors()

        populateValidParams(params)
        params.id = openid.id
        params.version = -1
        controller.update()

        assert view == "/openid/edit"
        assert model.openidInstance != null
        assert model.openidInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/openid/list'

        response.reset()

        populateValidParams(params)
        def openid = new Openid(params)

        assert openid.save() != null
        assert Openid.count() == 1

        params.id = openid.id

        controller.delete()

        assert Openid.count() == 0
        assert Openid.get(openid.id) == null
        assert response.redirectedUrl == '/openid/list'
    }
}
