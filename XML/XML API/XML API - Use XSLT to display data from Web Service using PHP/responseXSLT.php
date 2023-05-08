<body>
<?php
if (isset($_POST['paper'])) {
    $paper = $_POST['paper'];
} else {
    $paper = "Morning_Edition";
}
$xslDoc = new DOMDocument();
$xslDoc->load("xslt_response.xsl");
$xml = file_get_contents('https://wwwlab.webug.se/examples/XML/articleservice/articles/?paper='.$paper);
$xmlDoc = new DomDocument();
$xmlDoc->preserveWhiteSpace = FALSE;
$xmlDoc->loadXML($xml);
$proc = new XSLTProcessor();
$proc->importStylesheet($xslDoc);
echo $proc->transformToXML($xmlDoc);
?>
</body>