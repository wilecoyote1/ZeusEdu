<div id="selecteur" class="noprint" style="clear:both">

	<form name="selecteur" id="formSelecteur" method="POST" action="index.php" role="form" class="form-inline">
		
		<label for="bulletin">Bulletin n°</label>
		<select name="bulletin" id="bulletin" class="form-control-inline">
		{section name=bulletins start=1 loop=$nbBulletins+1}
			<option value="{$smarty.section.bulletins.index}"
					{if $smarty.section.bulletins.index == $bulletin}selected{/if}>
				{$smarty.section.bulletins.index}
			</option>
		{/section}
		</select>

		<select name="classe" id="selectClasse" class="form-control-inline">
			<option value="">Classe</option>
			{foreach from=$listeClasses item=uneClasse}
				<option value="{$uneClasse}"{if $uneClasse == $classe} selected="selected"{/if}>{$uneClasse}</option>
			{/foreach}
		</select>
		
		{if isset($prevNext.prev)}
			{assign var=matrPrev value=$prevNext.prev}
			<button class="btn btn-default btn-xs" id="prev" title="Précédent: {$listeEleves.$matrPrev.prenom} {$listeEleves.$matrPrev.nom}">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</button>
		{/if}

		<span id="choixEleve">
			{include file="listeEleves.tpl"}
		</span>
		
		{if isset($prevNext.next)}
			{assign var=matrNext value=$prevNext.next}
			<button class="btn btn-default btn-xs" id="next" title="Suivant: {$listeEleves.$matrNext.prenom} {$listeEleves.$matrNext.nom}">
				<span class="glyphicon glyphicon-chevron-right"></span>
			 </button> 
		{/if}
		
	<button type="submit" class="btn btn-primary btn-sm" id="envoi">OK</button>
	<input type="hidden" name="action" value="{$action}">
	<input type="hidden" name="mode" value="{$mode}">
	{if isset($prevNext)}
		<input type="hidden" name="prev" value="{$prevNext.prev}" id="matrPrev">
		<input type="hidden" name="next" value="{$prevNext.next}" id="matrNext">
	{/if}
	<input type="hidden" name="onglet" class="onglet" value="{$onglet|default:Null}">
	<input type="hidden" name="etape" value="{$etape}">
	</form>
</div>

<script type="text/javascript">

$(document).ready (function() {
	
	if ($("#selectClasse").val() == '') {
		$("#envoi").hide();
		}
		else $("#envoi").show();

	$("#formSelecteur").submit(function(){
		if (($("#selectClasse").val() == '') || ($("#selectEleve").val() == ''))
			return false;
		})
	
	$("#bulletin").change(function(){
		// $("#envoi").show();
		})

	$("#selectClasse").change(function(){
		// on a choisi une classe dans la liste déroulante
		var classe = $(this).val();
		if (classe != '') $("#envoi").show();
			else $("#envoi").hide();
		// la fonction listeEleves.inc.php renvoie la liste déroulante
		// des élèves de la classe sélectionnée
		$.post("inc/listeEleves.inc.php", {
			'classe': classe},
			function (resultat){
				$("#choixEleve").html(resultat)
				}
			)
	});

	$("#choixEleve").on("change","#selectEleve", function(){
		if ($(this).val() > 0) {
			// si la liste de sélection des élèves renvoie une valeur significative
			// le formulaire est soumis
			$("#formSelecteur").submit();
			}
		})
	
	$("#prev").click(function(){
		var matrPrev = $("#matrPrev").val();
		$("#selectEleve").val(matrPrev);
		$("#formSelecteur").submit();
	})
	
	$("#next").click(function(){
		var matrNext = $("#matrNext").val();
		$("#selectEleve").val(matrNext);
		$("#formSelecteur").submit();
	})
})

</script>
