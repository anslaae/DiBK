<!DOCTYPE html>
<%@page import="dibk.demo.Lokasjon"%>
<html>
<head>
	<meta name="layout" content="main" />
	<title>Søke eller ikke søke?</title>	
</head>
<body>
	<div id="main" class="panel panel-primary">
		<div class="panel-heading">
			<h1>Søke eller ikke søke?</h1>
		</div>
		<g:if test="${!connected }">
			<div class="alert alert-danger">Feil ved tilkobling til SMARTS</div>
		</g:if>
		<div class="alert alert-warning" id="intro">
			<p>Nettbasert søknadsservice som gir deg dokumentasjon på om du må søke når du har oppgitt tiltak og hvor du skal bygge(kommune, gårdsnummer og bruksnummer for din eiendom).</p>				
		</div>
		<div class="panel-body" id="wizard">
			<h3>
				<span class="label label-info">Velg kommune</span>
				<div class="btn-group">
					<button type="button" class="btn btn-default">
						${params.lokasjon ? params.lokasjon : 'Velg Lokasjon' }
					</button>
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">
						<span class="sr-only">Toggle Dropdown</span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" id='lokasjon'>
						<g:each var="lokasjon" in="${Lokasjon.all}">
							<li role="presentation"
								class="${params.lokasjon == lokasjon.navn ? 'active' : '' }"><a
								role="menuitem" tabindex="-1" href="?lokasjon=${lokasjon.navn}">
									${lokasjon.navn}
							</a></li>
						</g:each>
					</ul>
				</div>
				<div class="input-group" id="gbnr">
					<span class="input-group-addon">Gnr/Bnr</span>
					<input type="text" class="form-control" value="${params.gnr}" name="gnr">
					<span class="input-group-addon">/</span>
					<input type="text" class="form-control" value="${params.bnr}" name="bnr">
					<span class="input-group-btn">
						<button type="button" class="btn btn-default" onclick="valgtLokasjon()">Oppdater</button>
					</span>
				</div>
			</h3>			
			<div>
				<g:if test="${tiltakListe}">
					<h3>
						<span class="label label-info">Velg tiltak</span>
						<div class="btn-group" style="width: 500px;margin-top: 5px;">
							<button type="button" class="btn btn-default">
								${params.tiltak ? params.tiltak: 'Velg tiltak' }
							</button>
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">
								<span class="sr-only">Toggle Dropdown</span><span class="caret"></span>
							</button>							
							<ul class="dropdown-menu" role="menu">
								<g:each var="t" in="${tiltakListe}">
									<li role="presentation"	class="${params.tiltak == t.tiltaksnavn ? 'active' : '' }">
										<a role="menuitem" tabindex="-1" href="?lokasjon=${params.lokasjon}&gnr=${params.gnr}&bnr=${params.bnr}&tiltak=${t.tiltaksnavn}">${t.tiltaksnavn} - ${t.alias}</a>
									</li>
								</g:each>
								<!-- dummy-tilltak -->
								<li role="presentation" class="disabled"><a role="menuitem" >Antenne </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Ark på tak</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Avfallsbeholder </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Bad</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Balkong</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Basseng, flyttbart</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Biloppstillingsplass inntil 2 biler</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Bod, ute</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Bolig</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Boligblokk</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Borebrønn</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Brakke</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Bru</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Bruksendring</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Brygge</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Brønn</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Butikk</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Båtopplag</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Campingvogn, plassering</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Carport, frittstående</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Dam</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Dokkestue</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Driftsbygning i landbruk</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Drivhus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Enebolig</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Enebolig m/ sekundærleilighet</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Familiebarnehage </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fasadeendring </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fjellanlegg </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Flaggstang</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Flytebrygge</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Forretningsbygg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Forsamlingslokale</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Forstøtningsmur</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fritidsbebyggelse</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fritidsbolig</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fylling</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Fyringsanlegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Garasje</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Gassinstallasjoner</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Gasstank</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Gjerde mot nabo</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Gjerde mot veg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Heis</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Hotel</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Hundehus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Idrettsanlegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Ildsted</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Industribygg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Innglassing av veranda</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Industriovn</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Kai</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Kafè </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Kontor </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Lagerbygg </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Landbruksgarasje </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Leilighet </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Lekeapparat </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Lekehus </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Levegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Løfteinnretning </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Massedeponering </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Mast</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Markise</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Moloer</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Mudring</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Mur</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Næringsbygg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Oljetank</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Ominnredning, små</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Overnattingssted</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Parabolantenne</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Parkeringsplass, 2 biler</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Pergola</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Pipe</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Planering</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Portstolper, bolig </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Påbygg </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Rekkehus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Rekkverk</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Reklameskilt</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Restaurant</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Riving</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Salgslokale</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Sammenkjedet enebolig </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Sandstrand </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Sekundærlighet </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Skilt </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Stall </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Støyskjerm </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Svømmebasseng </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Søppelstativ </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Takoppløft</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Takvindu</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Tiltak etter havneloven</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Telt</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Terasse</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Terrenginngrep </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Tilbygg bolig inntil 50m2</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Tomannsbolig </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Tilbygg bolig inntil 50m2</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Transformatorkiosk </a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Trappestolheis</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Tribuner</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Underjordiske anlegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Utepeis</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Uthus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Veganlegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Veksthus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Ventilasjonsanlegg</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Veranda</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Vindu</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Våningshus</a></li>
								<li role="presentation" class="disabled"><a role="menuitem" >Våtrom</a></li>
							</ul>							
						</div>
					</h3>
				</g:if>
				<g:if test="${tiltak}">
					<div class="well">
						<ul class="list-group" id="valgtTiltak">
							<g:each var="t" in="${tiltak.Egenskap}">
								<li class="${t.navn}">
									${t.beskrivendeTekst}
								</li>
							</g:each>
						</ul>
					</div>
					
					<div class="input-group" style="width: 150px;margin-bottom:5px;">
						<span class="input-group-addon">Er <a href="#" id="tool" title="" onmouseover="tooltip.show('<strong>Tiltak</strong><br/>Definert som bla bla bla ...<br/>... håtten tåtten tei ...', 300);" onmouseout="tooltip.hide();">tiltak<p class="tooltip">tut og kjør</p></a> i samsvar med plan</span>
						<span class="input-group-addon">
							<input name="samsvarMedPlan" type="checkbox">
						</span>
					</div>
					
					<div class="btn-group" id="aksjoner">
						<button type="button" class="btn btn-default" onclick="endre()">Tilpass</button>
						<button type="button" class="btn btn-default" onclick="vurder()">Vurder</button>
					</div>
																	
					<div class="alert alert-info alert" id="resultatOk" hidden="true">
						<button type="button" class="close" onclick="lukkMelding(this)">&times;</button>
						<p class="resultat"></p>
						<ul class="urler"></ul>							
					</div>
					<div class="alert alert-danger alert" id="ikkeISamsvarMedPlan" hidden="true">
						<button type="button" class="close" onclick="lukkMelding(this)">&times;</button>
						<p>Tiltak må være i samsvar med plan for å vurderes</p>
					</div>
					<div class="alert alert-danger alert" id="resultatError" hidden="true">
						<button type="button" class="close" onclick="lukkMelding(this)">&times;</button>
						<p>Kunne ikke gjennomføre vurdering</p>
						<p class="melding" hidden="true"></p>											
					</div>						
				</g:if>
			</div>
			

			<div class="lister" id="tilpassTiltak" hidden="true">
				<div class="well">
					<h3><span class="label label-info">Egenskaper</span></h3>
					<ul class="list-group" id="valgteEgenskaper">
						<g:if test="${valgteEgenskaper}">
							<g:each var="t" in="${valgteEgenskaper}">
								<li class="list-group-item ${t.navn}">
									<g:if test="${t.type == 'bool'}">
										<div class="input-group">
											<button type="button" class="btn btn-default" onclick="flytt(this)">
									  			<span class="glyphicon glyphicon-minus-sign"></span>
											</button>
											<span class="input-group-addon">${t.ledetekst}</span>
											<span class="input-group-addon">
												<input name="${t.navn}" type="checkbox" checked="${t.value ? 'checked' : '' }">
											</span>
										</div>
									</g:if>
									<g:if test="${t.type == 'double'}">
										<div class="input-group">
											<button type="button" class="btn btn-default" onclick="flytt(this)">
									  			<span class="glyphicon glyphicon-minus-sign"></span>
											</button>
											<span class="input-group-addon">${t.ledetekst}</span>
											<input type="text" name="${t.navn}" class="form-control" value="${t.verdi}">											
										</div>
									</g:if>
								</li>
							</g:each>							
						</g:if>
					</ul>
					<hr NOSHADE>
					<ul class="list-group" id="egenskaper">
						<g:if test="${muligeEgenskaper}">
							<g:each var="t" in="${muligeEgenskaper}">
								<li class="list-group-item ${t.navn}">
									<g:if test="${t.type == 'bool'}">
										<div class="input-group">
											<button type="button" class="btn btn-default" onclick="flytt(this)">
									  			<span class="glyphicon glyphicon-plus-sign"></span>
											</button>
											<span class="input-group-addon">${t.ledetekst}</span>
											<span class="input-group-addon">
												<input name="${t.navn}" type="checkbox">
											</span>
										</div>
									</g:if>
									<g:if test="${t.type == 'double'}">
										<div class="input-group">
											<button type="button" class="btn btn-default" onclick="flytt(this)">
									  			<span class="glyphicon glyphicon-plus-sign"></span>
											</button>
											<span class="input-group-addon">${t.ledetekst}</span>
											<input type="text" name="${t.navn}" class="form-control">											
										</div>
									</g:if>
								</li>
							</g:each>							
						</g:if>
					</ul>					
				</div>
			</div>
		</div>
		<div class="panel-footer">
		<g:if test="${feil}">
			<div class="alert alert-danger">
				<strong>${feil}</strong>
				<div>${resultatDebug}</div>
			</div>
		</g:if>			
		</div>
	</div>	
</body>
</html>
