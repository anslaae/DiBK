<!DOCTYPE html>
<%@page import="dibk.demo.Lokasjon"%>
<html>
<head>
<meta name="layout" content="main" />
<title>DiBK Demo</title>
</head>
<body>
	<div id="main" class="panel panel-primary">
		<div class="panel-heading">
			<h1>DiBK Demo</h1>
		</div>
		<div class="panel-body">
			<div class="btn-group">
				<button type="button" class="btn btn-default">Velg Lokasjon</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><span class="sr-only">Toggle Dropdown</span><span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<g:each var="lokasjon" in="${Lokasjon.all}">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="?lokasjon=${lokasjon.navn}"> ${lokasjon.navn}
						</a></li>
					</g:each>
				</ul>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default">Søk</button>
			</div>
			<g:if test="${params.lokasjon}">
				<div class="lister">
					<div class="well">
						<h2>Egenskaper</h2>
						<ul class="list-group" id="egenskaper">
							<li class="list-group-item" onclick="flytt(this)">Cras justo odio</li>
							<li class="list-group-item" onclick="flytt(this)">Dapibus ac facilisis in</li>
							<li class="list-group-item" onclick="flytt(this)">Morbi leo risus</li>
							<li class="list-group-item" onclick="flytt(this)">Porta ac consectetur ac</li>
							<li class="list-group-item" onclick="flytt(this)">Vestibulum at eros</li>
						</ul>
					</div>
					<div class="well">
						<h2>Valgte egenskaper</h2>
						<ul class="list-group" id="valgteEgenskaper">							
						</ul>
					</div>					
				</div>					
			</g:if>			
		</div>
		<div class="panel-footer">
			resultat
		</div>
	</div>
	<g:javascript>
		
		
	</g:javascript>
</body>
</html>
