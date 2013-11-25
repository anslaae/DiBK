var tooltip=function(){
 var id = 'tt';
 var top = 3;
 var left = 3;
 var maxw = 300;
 var speed = 10;
 var timer = 20;
 var endalpha = 95;
 var alpha = 0;
 var tt,t,c,b,h;
 var ie = document.all ? true : false;
 return{
  show:function(v,w){
   if(tt == null){
    tt = document.createElement('div');
    tt.setAttribute('id',id);
    t = document.createElement('div');
    t.setAttribute('id',id + 'top');
    c = document.createElement('div');
    c.setAttribute('id',id + 'cont');
    b = document.createElement('div');
    b.setAttribute('id',id + 'bot');
    tt.appendChild(t);
    tt.appendChild(c);
    tt.appendChild(b);
    document.body.appendChild(tt);
    tt.style.opacity = 0;
    tt.style.filter = 'alpha(opacity=0)';
    document.onmousemove = this.pos;
   }
   tt.style.display = 'block';
   c.innerHTML = v;
   tt.style.width = w ? w + 'px' : 'auto';
   if(!w && ie){
    t.style.display = 'none';
    b.style.display = 'none';
    tt.style.width = tt.offsetWidth;
    t.style.display = 'block';
    b.style.display = 'block';
   }
  if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
  h = parseInt(tt.offsetHeight) + top;
  clearInterval(tt.timer);
  tt.timer = setInterval(function(){tooltip.fade(1)},timer);
  },
  pos:function(e){
   var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
   var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
   tt.style.top = (u - h) + 'px';
   tt.style.left = (l + left) + 'px';
  },
  fade:function(d){
   var a = alpha;
   if((a != endalpha && d == 1) || (a != 0 && d == -1)){
    var i = speed;
   if(endalpha - a < speed && d == 1){
    i = endalpha - a;
   }else if(alpha < speed && d == -1){
     i = a;
   }
   alpha = a + (i * d);
   tt.style.opacity = alpha * .01;
   tt.style.filter = 'alpha(opacity=' + alpha + ')';
  }else{
    clearInterval(tt.timer);
     if(d == -1){tt.style.display = 'none'}
  }
 },
 hide:function(){
  clearInterval(tt.timer);
   tt.timer = setInterval(function(){tooltip.fade(-1)},timer);
  }
 };
}();


function flytt(item) {
	if (item.parentNode.parentNode.parentNode.id == "egenskaper") {
		$(item).children().removeClass("glyphicon-plus-sign").addClass("glyphicon-minus-sign"); 
		item.parentNode.parentNode.parentNode.removeChild(item.parentNode.parentNode);
		$("#valgteEgenskaper").append(item.parentNode.parentNode);
	} else {
		$(item).children().removeClass("glyphicon-minus-sign").addClass("glyphicon-plus-sign");
		item.parentNode.parentNode.parentNode.removeChild(item.parentNode.parentNode);
		$("#egenskaper").append(item.parentNode.parentNode);
	}
}

function vurder() {
	$("#ikkeISamsvarMedPlan").hide(50);
	$('#resultatError').hide(50);	
	$('#resultatOk').hide(50);
	if(samsvarMedPlan()){
		$("body").css("cursor", "wait");
		$(".btn").css("cursor", "wait");
		var arr = $("#valgteEgenskaper :input").serializeArray();
		$("#valgteEgenskaper :input:checkbox:not(:checked)").each(function() {
			arr.push({'name':$(this).attr('name'),'value':'off'});
		});
					
		var lokArr = [];
		lokArr.push($('ul[id="lokasjon"] li[class="active"] a').text().trim());
		lokArr.push($("input[name$='gnr']").val().trim());
		lokArr.push($("input[name$='bnr']").val().trim());
		
		arr.push({'name':'lokasjon','value': lokArr});
	
		var json = JSON.stringify(arr);
		
		$.ajax({
			url: "rule/vurder",
			data: json,
			contentType: 'application/json; charset=UTF-8',
			type: "POST",
			success: function(data) {
				$(".btn").css("cursor", "pointer");
				$("body").css("cursor", "default");			
				var r = eval(data);
				console.log(r);
				if(r.status != null && r.status){
					$('#resultatOk .resultat').text(r.svar);
					if(r.urler != null){
						r.urler.forEach(function(entry) {
							$('#resultatOk .urler').append('<li><a href="'+entry+'"+>'+entry+'</a></li>')
						});
					}
					$('#resultatOk').show(500);
									
				} else {
					if(r.svar != null){
						$('#resultatError .melding').text(r.svar)
					}
					$('#resultatError').show(500);
				}
		    }
		})
	} else {
		$("#ikkeISamsvarMedPlan").show(100);
	}
}

function disconnect() {
	$.ajax({
		url: "rule/disconnect"
	})
}

function endre(){
	$('#tilpassTiltak').toggle(200);
}

function valgtLokasjon(){
	var url = "?lokasjon=" + $('ul[id="lokasjon"] li[class="active"] a').text().trim() + "&gnr=" + $("input[name$='gnr']").val().trim() + "&bnr=" + $("input[name$='bnr']").val().trim();
	window.location = url;
}

function samsvarMedPlan(){	
	return $("input[name='samsvarMedPlan']").is(':checked');
}

function lukkMelding(item){
	$(item.parentNode).hide(100);
}
