package dibk.demo

import grails.converters.JSON;

import org.apache.jasper.compiler.Node.ParamsAction;

class RuleController {

	def ruleService
	
    def index() {
		if(params.lokasjon && params.tiltak){
			def c = ruleService.connect()
			def resultat = ruleService.getTiltak(params.lokasjon, params.gnr, params.bnr)
			def tiltak = resultat.tiltak.find{ it.tiltaksnavn == params.tiltak }
			def valgteEgenskaper = []
			def muligeEgenskaper = []
			resultat.egenskaper.each{
				if(tiltak.Egenskap.navn.contains(it.navn)){
					valgteEgenskaper += it
				} else {
					muligeEgenskaper += it
				}				
			}
			valgteEgenskaper.each{
				it.verdi = tiltak.Egenskap.find{ ve ->
					ve.name == it.name
				}.verdi
			}
			[connected:  c, resultat: resultat.tiltak, tiltak: tiltak, egenskaper: resultat.egenskaper, valgteEgenskaper: valgteEgenskaper, muligeEgenskaper: muligeEgenskaper]
		}else if(params.lokasjon){
			[connected: ruleService.connect(), resultat: ruleService.getTiltak(params.lokasjon, params.gnr, params.bnr).tiltak]			
		} else {
			[connected: ruleService.connect()]
		}
	}
	
	def disconnect() {
		render ruleService.disconnnect()		 
	}
	
	def vurder() {		
		def res = ruleService.vurder(request.JSON)
		if(res){
			println res.svar
			println res.urler
			render ([status: true, svar: res.svar, urler: res.urler] as JSON)
		} else {
			render ([status: false] as JSON)
		}
	}
}
