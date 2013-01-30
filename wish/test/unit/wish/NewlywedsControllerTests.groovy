package wish



import org.junit.*
import grails.test.mixin.*

@TestFor(NewlywedsController)
@Mock(Newlyweds)
class NewlywedsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newlyweds/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newlywedsInstanceList.size() == 0
        assert model.newlywedsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.newlywedsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newlywedsInstance != null
        assert view == '/newlyweds/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newlyweds/show/1'
        assert controller.flash.message != null
        assert Newlyweds.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newlyweds/list'

        populateValidParams(params)
        def newlyweds = new Newlyweds(params)

        assert newlyweds.save() != null

        params.id = newlyweds.id

        def model = controller.show()

        assert model.newlywedsInstance == newlyweds
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newlyweds/list'

        populateValidParams(params)
        def newlyweds = new Newlyweds(params)

        assert newlyweds.save() != null

        params.id = newlyweds.id

        def model = controller.edit()

        assert model.newlywedsInstance == newlyweds
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newlyweds/list'

        response.reset()

        populateValidParams(params)
        def newlyweds = new Newlyweds(params)

        assert newlyweds.save() != null

        // test invalid parameters in update
        params.id = newlyweds.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newlyweds/edit"
        assert model.newlywedsInstance != null

        newlyweds.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newlyweds/show/$newlyweds.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newlyweds.clearErrors()

        populateValidParams(params)
        params.id = newlyweds.id
        params.version = -1
        controller.update()

        assert view == "/newlyweds/edit"
        assert model.newlywedsInstance != null
        assert model.newlywedsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newlyweds/list'

        response.reset()

        populateValidParams(params)
        def newlyweds = new Newlyweds(params)

        assert newlyweds.save() != null
        assert Newlyweds.count() == 1

        params.id = newlyweds.id

        controller.delete()

        assert Newlyweds.count() == 0
        assert Newlyweds.get(newlyweds.id) == null
        assert response.redirectedUrl == '/newlyweds/list'
    }
}
