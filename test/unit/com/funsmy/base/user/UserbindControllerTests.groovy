package com.funsmy.base.user



import org.junit.*
import grails.test.mixin.*

@TestFor(UserbindController)
@Mock(Userbind)
class UserbindControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userbind/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userbindInstanceList.size() == 0
        assert model.userbindInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userbindInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userbindInstance != null
        assert view == '/userbind/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userbind/show/1'
        assert controller.flash.message != null
        assert Userbind.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userbind/list'

        populateValidParams(params)
        def userbind = new Userbind(params)

        assert userbind.save() != null

        params.id = userbind.id

        def model = controller.show()

        assert model.userbindInstance == userbind
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userbind/list'

        populateValidParams(params)
        def userbind = new Userbind(params)

        assert userbind.save() != null

        params.id = userbind.id

        def model = controller.edit()

        assert model.userbindInstance == userbind
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userbind/list'

        response.reset()

        populateValidParams(params)
        def userbind = new Userbind(params)

        assert userbind.save() != null

        // test invalid parameters in update
        params.id = userbind.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userbind/edit"
        assert model.userbindInstance != null

        userbind.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userbind/show/$userbind.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userbind.clearErrors()

        populateValidParams(params)
        params.id = userbind.id
        params.version = -1
        controller.update()

        assert view == "/userbind/edit"
        assert model.userbindInstance != null
        assert model.userbindInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userbind/list'

        response.reset()

        populateValidParams(params)
        def userbind = new Userbind(params)

        assert userbind.save() != null
        assert Userbind.count() == 1

        params.id = userbind.id

        controller.delete()

        assert Userbind.count() == 0
        assert Userbind.get(userbind.id) == null
        assert response.redirectedUrl == '/userbind/list'
    }
}
