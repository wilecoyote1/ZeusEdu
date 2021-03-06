<div id="selecteur" class="selecteur noprint" style="clear:both">
	<form name="selecteur" id="formSelecteur" method="POST" action="index.php">
	<label for="niveauCours">Niveau des cours</label>
	<select name="niveau" id="niveauCours">
		<option value="">Niveau</option>
		{foreach from=$listeNiveaux key=k item=unNiveau}
			<option value="{$unNiveau}"{if isset($niveau) && ($unNiveau == $niveau)} selected{/if} title="{$unNiveau}e année">{$unNiveau}</option>
		{/foreach}
	</select>

	<span id="choixCours">
	{if isset($listeCoursGrp)}
		<select name="coursGrp" id="coursGrp">
		<option value="">Choisir un cours</option>
			{foreach from=$listeCoursGrp key=unCoursGrp item=data}
		<option value="{$unCoursGrp}"{if isset($coursGrp) && ($unCoursGrp==$coursGrp)} selected{/if}>[{$data.coursGrp}] {*$data.annee*} {*$data.statutCours*} {$data.libelle} {$data.nbheures}h</option>
		{/foreach}
		</select>
	{/if}
	</span>
	
	<button type="submit" class="btn btn-primary btn-sm" id="envoi">OK</button>
	<input type="hidden" name="action" value="{$action}">
	<input type="hidden" name="mode" value="{$mode}">
	<input type="hidden" name="etape" value="show"><br>
	
	</form>
</div>

<script type="text/javascript">

$(document).ready (function() {

	$("#formSelecteur").submit(function(){
		var niveau = $("#niveauCours").val();
		var coursGrp = $("#coursGrp").val();
		if (niveau && coursGrp) {
			$("#wait").show();
			$("#corpsPage").hide();
		}
		else return false;
	})

	$("#niveauCours").change(function(){
		$("#wait").show();
		var niveau = $(this).val();
		if (niveau)
			$.post("inc/listeEprExterneNiveau.inc.php",
				{niveau: niveau},
					function (resultat){
						$("#choixCours").html(resultat)
					}
				)
		$("#wait").hide();
	});
	
	$("#choixCours").on("change", "#coursGrp", function(){
		$("#formSelecteur").submit();
		})
	
})

</script>
