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
			if(resultat && tiltak){
				resultat.egenskaper.sort{ it.rekkefolge }.each{
					if(tiltak.Egenskap.navn.contains(it.navn)){
						valgteEgenskaper += it
					} else {
						muligeEgenskaper += it
					}
				}
				valgteEgenskaper.each{
					it.verdi = tiltak.Egenskap.find{ ve ->
						ve.navn == it.navn
					}.verdi
				}
				[connected:  c, tiltakListe: resultat.tiltak, tiltak: tiltak, egenskaper: resultat.egenskaper, valgteEgenskaper: valgteEgenskaper, muligeEgenskaper: muligeEgenskaper]
			} else {
				[connected:  c, feil: "Uventet resultat", resultatDebug: resultat]
			}
		}else if(params.lokasjon){
			def c = ruleService.connect()
			def tiltak = ruleService.getTiltak(params.lokasjon, params.gnr, params.bnr)?.tiltak
			if(tiltak)
				[connected: c, tiltakListe: tiltak]
			else
				[connected: c]
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
