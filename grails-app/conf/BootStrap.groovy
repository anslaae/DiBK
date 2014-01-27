import dibk.demo.Lokasjon


class BootStrap {

	def init = { servletContext ->
		lokasjoner() 
	}
	def destroy = {
	}

	def lokasjoner = {
		new Lokasjon(navn: "Ski").save()
		new Lokasjon(navn: "Bjerkreim").save()
		new Lokasjon(navn: "Oslo").save()
	}
}
