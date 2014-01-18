//TODO: Tooltip på f.eks. BRA
//TODO: Autokomplete på dropdown
//TODO: "Alle tiltak må være i samsvar med plan" flyttes opp, fjernes fra egenskaper
//TODO: responser

package dibk.demo

import grails.converters.JSON;
import grails.transaction.Transactional

import com.sparklinglogic.rest.sdk.SlRestClient
import com.sparklinglogic.rest.sdk.SlRestClientConfig

@Transactional
class RuleService {

	SlRestClient client
	def sessionID
	def grailsApplication
	
	def timeout
	
	def connect(){
		//if(!client || !sessionID){
			try{
				println "Debug [connect]: Kobler til SMARTS"
				String key = grailsApplication.config.smarts.key;
				String appId = grailsApplication.config.smarts.appId;

				String username = grailsApplication.config.smarts.username;
				String password = grailsApplication.config.smarts.password;

				SlRestClientConfig config = new SlRestClientConfig()
				config.setServiceUrl(grailsApplication.config.smarts.url)
	//			config.setConnectionTimeout(10)
				client = new SlRestClient(config, appId, key)

				//timeout = 
				String response = client.Connect(username, password, grailsApplication.config.smarts.workspace, grailsApplication.config.smarts.project);				
				JSON.use('deep')
				def jsonResponse = JSON.parse(response)
				sessionID = jsonResponse.Header.SessionId

				return 	jsonResponse.Success
			} catch (Exception e){
				client = null
				sessionID = null
				println "Feil ved tilkobling til SMARTS [connect]: " + e.message
			}
//		} else {
//			return true
//		}
	}
		
	def getTiltak(def lokasjon, def gnr, def bnr) {		
		def req ="{\"Foresporsel\": {\"lokasjon\": {kommune: \""+lokasjon+"\",gnr: \""+gnr+"\",bnr: \""+bnr+"\"}}}";
		
		if(client && sessionID){
			try{				
				JSON.use('deep')
				String response = client.Evaluate(sessionID, "MuligeTiltak decision", "["+req+"]");
				def jsonResponse = JSON.parse(response)
				println "Debug [getTiltak]: " + jsonResponse.Success				
				return [tiltak: jsonResponse.Body.Documents.Svar.Tiltak[0], egenskaper: jsonResponse.Body.Documents.Svar.MuligEgenskap[0]]
			} catch (Exception e){
				println "Feil ved tilkobling til SMARTS [getTiltak]: " + e.message
			}
		} else {
			println "Noe gikk galt [getTiltak]"
		}
	}
	
	def vurder(def json) {
		def jsonLokasjon = json.find(){
			it.name == "lokasjon"
		}		
				 
		def kom = jsonLokasjon.value[0]
		def gnr = jsonLokasjon.value[1]
		def bnr = jsonLokasjon.value[2]
		def lokasjon = "\"lokasjon\": {\"kommune\": \"" + kom + "\",\"gnr\":\"" + gnr + "\", \"bnr\": \"" + bnr + "\"}"
			
		def egenskaper ="\"Egenskap\":["
		def jsonEgenskaper = json.findAll(){
			it.name != "lokasjon"
		}
		jsonEgenskaper.each{			
			def v = it.value == "on" ? "true" : it.value			
			egenskaper += "{\"navn\":\""+it.name+"\",\"type\":\"\",\"verdi\":\""+v+"\"}"			
			
			if(it != jsonEgenskaper.last()) {
				egenskaper+=","
			}
		}		
		egenskaper +="]";	

		def req = "{\"Foresporsel\": {"+ lokasjon + ","+egenskaper+"}}"		

		if(client && sessionID){
			try{				
				JSON.use('deep')
				String response = client.Evaluate(sessionID, "Vurder sakstype decision", "["+req+"]");
				def jsonResponse = JSON.parse(response)
				println "Debug [vurder]: " + jsonResponse.Success				
				if(jsonResponse.Success){
					return [svar: jsonResponse.Body.Documents.Svar.soknadstype[0], urler: jsonResponse.Body.Documents.Svar.urlGjeldendeRegler[0]]
				}
			} catch (Exception e){
				println "Feil ved tilkobling til SMARTS [vurder]: " + e.message
			}
		} else {
			println "Noe gikk galt [vurder]"
		}
	}
	
	def disconnnect(){
		println "Debug [disconnnect]"
		if(client && sessionID){
			String response = client.Disconnect(sessionID);
			JSON.use('deep')
			def jsonResponse = JSON.parse(response)		
			println "Debug [disconnnect]: " + jsonResponse.Success
			sessionID = null
			return jsonResponse.Success
		} else {
			println "Noe gikk galt [disconnnect]"
			return false
		}
	}

	def testService(){
		println "tester"
	}
}
