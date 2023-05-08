<html>

<body>
    <form method='POST' action="formself.php">

        <?php

        $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/articleservice/papers");
        $dom = new DomDocument;
        $dom->preserveWhiteSpace = FALSE;
        $dom->loadXML($xml);
        echo "<select name='formPaper'>";
        $newspapers = $dom->getElementsByTagName("NEWSPAPER");
        foreach ($newspapers as $newspaper) {
            /* echo $newspaper->getAttribute("NAME"); */
            echo "<option value='" . $newspaper->getAttribute("TYPE") . "'>";
            echo $newspaper->getAttribute("NAME");
            echo "</option>";
        }
        echo $newspaper->getAttribute("TYPE");


        echo "</select>";
        ?>
        <button>Send</button>
    </form>



    <table border="1">
        <?php

        // Unknown is default
        if (isset($_POST["formPaper"])) {
            $paper = $_POST['formPaper'];
        } else {
            $paper = "Morning_Edition";
        }

        $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/articleservice/articles?paper=" . $paper);
        $dom = new DomDocument;
        $dom->preserveWhiteSpace = FALSE;
        $dom->loadXML($xml);

        $newspapers = $dom->getElementsByTagName("NEWSPAPER");
        foreach ($newspapers as $newspaper) {
            echo "<tr>";
            echo "<td style='text-align: center; padding: 5px;'>" . $newspaper->getAttribute("NAME") . "</td>";
            echo "<td style='text-align: center; padding: 5px;'>";
            echo "<strong> Subscribers: </strong>" . $newspaper->getAttribute("SUBSCRIBERS") . " " . $newspaper->getAttribute("TYPE");
            echo "</td>";
            echo "<td>";
            echo "<table>";
            echo "<tr>";
            foreach ($newspaper->childNodes as $article) {
                echo "<td style='vertical-align: top;'>";
                echo "<table style='padding:5px; margin:10px; text-align: center; box-shadow: 2px 2px;";
                if ($article->getAttribute("DESCRIPTION") == "News") {
                    echo " background-color: #ebdfc0;'>";
                } else {
                    echo " background-color: #c0ebd1;'>";
                }
                echo "<tr><td style='text-align: left;'>" . $article->getAttribute("ID") . ", " . $article->getAttribute("TIME") . " " . $article->getAttribute("DESCRIPTION") . "</td></tr>";
                foreach ($article->childNodes as $content) {
                    if ($content->nodeName == "HEADING") {
                        foreach ($content->childNodes as $header) {
                            $headerText = trim($header->nodeValue);
                            if ($headerText != "") {
                                echo "<tr><td><h3 style='text-align: center;'>" . $headerText . "</h3></td></tr>";
                            }
                        }
                    } else if ($content->nodeName == "STORY") {
                        foreach ($content->childNodes as $story) {
                            $storyText = trim($story->nodeValue);
                            if ($storyText != "") {
                                echo "<tr><td><div><p>" . $storyText . "</p></div></td></tr>";
                            }
                        }
                    }
                }
                echo "</table>";
                echo "</td>";
            }
            echo "</td>";
            echo "</tr>";
            echo "</table>";
            echo "</tr>";
        }
        ?>
    </table>

</body>

</html>