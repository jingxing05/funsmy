package com.funsmy.base.user



import org.junit.*
import grails.test.mixin.*

@TestFor(UserprofileController)
@Mock(Userprofile)
class UserprofileControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userprofile/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userprofileInstanceList.size() == 0
        assert model.userprofileInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userprofileInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userprofileInstance != null
        assert view == '/userprofile/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userprofile/show/1'
        assert controller.flash.message != null
        assert Userprofile.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userprofile/list'

        populateValidParams(params)
        def userprofile = new Userprofile(params)

        assert userprofile.save() != null

        params.id = userprofile.id

        def model = controller.show()

        assert model.userprofileInstance == userprofile
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userprofile/list'

        populateValidParams(params)
        def userprofile = new Userprofile(params)

        assert userprofile.save() != null

        params.id = userprofile.id

        def model = controller.edit()

        assert model.userprofileInstance == userprofile
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userprofile/list'

        response.reset()

        populateValidParams(params)
        def userprofile = new Userprofile(params)

        assert userprofile.save() != null

        // test invalid parameters in update
        params.id = userprofile.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userprofile/edit"
        assert model.userprofileInstance != null

        userprofile.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userprofile/show/$userprofile.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userprofile.clearErrors()

        populateValidParams(params)
        params.id = userprofile.id
        params.version = -1
        controller.update()

        assert view == "/userprofile/edit"
        assert model.userprofileInstance != null
        assert model.userprofileInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userprofile/list'

        response.reset()

        populateValidParams(params)
        def userprofile = new Userprofile(params)

        assert userprofile.save() != null
        assert Userprofile.count() == 1

        params.id = userprofile.id

        controller.delete()

        assert Userprofile.count() == 0
        assert Userprofile.get(userprofile.id) == null
        assert response.redirectedUrl == '/userprofile/list'
    }
}
