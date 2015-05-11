<?php 
require_once('config.inc.php');

// définition de la class USER utilisée en variable de SESSION
require_once (INSTALL_DIR."/inc/classes/classUser.inc.php");

// définition de la class Application
require_once (INSTALL_DIR."/inc/classes/classApplication.inc.php");
session_start();
$Application = new Application();

if (isset($_SESSION)) {
  // définition de la class USER utilisée en variable de SESSION
  require_once (INSTALL_DIR."/inc/classes/classUser.inc.php");
  $user = $_SESSION[APPLICATION];
  // retour de la session de l'administrateur, sauvegardée dans la variable de session
  $_SESSION[APPLICATION] = $user->getAlias();
  $user = $_SESSION[APPLICATION];
  }
  else $user = Null;
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Déconnexion</title>
	<link type="text/css" media="all" rel="stylesheet" href="screen.css">
	<link type="text/css" media="screen" rel="stylesheet" href="js/blockUI.css">	
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

</head>
<body>
<img src="images/bigwait.gif" id="wait" alt="wait">

<script type="text/javascript">
  
  window.location.assign('index.php');
  
</script>
</body>
</html>