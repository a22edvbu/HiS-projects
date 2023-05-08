<html>
<head>
</head>
<body>
<?php
$xslDoc = new DOMDocument();
$xslDoc->load("xslt_select.xsl");
$xml = file_get_contents('https://wwwlab.webug.se/examples/XML/articleservice/papers/');
$xmlDoc = new DomDocument;
$xmlDoc->preserveWhiteSpace = FALSE;
$xmlDoc->loadXML($xml);

$proc = new XSLTProcessor();
$proc->importStylesheet($xslDoc);
echo $proc->transformToXML($xmlDoc);
?>
</body>
</html>