import com.funsmy.base.metadata.Permission
import com.funsmy.base.user.Userbind
import com.funsmy.base.user.Role
import com.funsmy.base.user.User
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

	def init = { servletContext ->

		def privilegeall = new Permission(name: 'all', privilege:'*:*',description:'全部权限')
		privilegeall.save();

		def defaultprivilege = new Permission(name:'default', privilege:'*:index',description:'index权限')
		defaultprivilege.save()

		def adminRole = new Role(name: 'Admin',alias:'管理员')
		adminRole.addToPermissions(privilegeall)
		adminRole.save()

		def user = new User(
				email:'fuck@u.com',
				username: "mm",
				passwordhash: '123123',
				sex:1
				);
		user.addToRoles(adminRole)
		user.save();

		user = new User(
				email:'t@t.com',
				username: "qfeng",
				passwordhash: '123123',
				sex:0
				);
		user.addToRoles(adminRole)
		user.save();

		def openplatform = new Userbind(
				user:user,
				provider:'qqt',
				uidstr:'2EB90C6B3E8238EE80E01839A94CE7F6',
				accesstoken:'9b38646d3e55421a4ccc058e562b1bd8',
				lasttokentime:new Date(),
				expiresin:1209600,
				)
		openplatform.save();

		if(openplatform.hasErrors()){
			println openplatform.errors
		} 
	}
	def destroy = {
	}
}
