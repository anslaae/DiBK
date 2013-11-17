import dibk.demo.Lokasjon


class BootStrap {

	def init = { servletContext -> norskeFylker() }
	def destroy = {
	}

	def norskeFylker = {
		println "Legger til fylker"
		new Lokasjon(navn: "Østfold").save()
		new Lokasjon(navn: "Akershus").save()
		new Lokasjon(navn: "Oslo").save()
		new Lokasjon(navn: "Hedmark").save()
		new Lokasjon(navn: "Oppland").save()
		new Lokasjon(navn: "Buskerud").save()
		new Lokasjon(navn: "Vestfold").save()
		new Lokasjon(navn: "Telemark").save()
		new Lokasjon(navn: "Aust-Agder").save()
		new Lokasjon(navn: "Vest-Agder").save()
		new Lokasjon(navn: "Rogaland").save()
		new Lokasjon(navn: "Hordaland").save()
		new Lokasjon(navn: "Sogn og Fjordane").save()
		new Lokasjon(navn: "Møre og Romsdal").save()
		new Lokasjon(navn: "Sør-Trøndelag").save()
		new Lokasjon(navn: "Nord-Trøndelag").save()
		new Lokasjon(navn: "Nordland").save()
		new Lokasjon(navn: "Troms").save()
		new Lokasjon(navn: "Finnmark").save()
	}
}
