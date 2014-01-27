import dibk.demo.Lokasjon


class BootStrap {

	def init = { servletContext ->
		//new Lokasjon(navn: "Sentral").save()
		lokasjoner() 
	}
	def destroy = {
	}

	def lokasjoner = {
		new Lokasjon(navn: "Ski").save()
		new Lokasjon(navn: "Bjerkreim").save()
		new Lokasjon(navn: "Oslo").save()
		//new Lokasjon(navn: "Vestby").save()
	}
}
