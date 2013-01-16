
// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

import org.scribe.model.SignatureType


grails.project.groupId = funsmy // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

/**
 * site 配置 站点基本信息
 */
site.infor.name='Java版本  - 测试 - 川流网'
site.infor.version='Beta0.1'
site.infor.versionnumber = '16095'  
site.infor.keywords= '川流网,川流电子商务社区,电子商务社区,川流电商社区'
site.infor.description = '川流网是集社交(SNS)、购物于一体的社会化电子商务平台'



/**
 * 外站帐号key
 * API Key: 
8dlvws442tnk 
 Secret Key: 
9ChfJzwuMeRdffz3 
 OAuth User Token: 
d75300ee-170a-4443-adfd-d98a24eba043 
 OAuth User Secret: 
61f483bc-b887-43e1-9493-b17fc3dfad0c  
 
 */
oauth { 
		providers {
			qqt{
				//api =  QqtApi
				api = com.funsmy.utils.oauth.QqtApi
				key = '801294442'
				secret = '1e1861d695a904b4f2128bc4632a2da4'
				//scope = 'my-scope'
				signatureType = SignatureType.QueryString
				callback =  "http://localhost:8080/funsmy/oauth/qqt/callback"
				successUri = '/auth/oauthbind?provider=qqt'
				failureUri = '/auth/unauthorized'
			} 
			sina{
				//api =  QqtApi
				api = org.scribe.builder.api.LinkedInApi
				key = '8dlvws442tnk'
				secret = '9ChfJzwuMeRdffz3'
				//scope = 'my-scope'
				signatureType = SignatureType.QueryString
				callback = "http://localhost:8080/funsmy/oauth/sina/callback"
				successUri = '/auth/oauthbind?provider=sina'
				failureUri = '/auth/unauthorized'
			}
		} 
		connectTimeout = 5000
		receiveTimeout = 5000 
} 