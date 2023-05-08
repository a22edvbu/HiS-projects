<html>

<body>
        <?php
        $paragraphs="";
        function startElement($parser, $entityname, $attributes)
        {
            global $paragraphs;
            if ($entityname == "ARTICLES") {
                echo "<table id='test' border='1'>";
            } else if ($entityname == "NEWSPAPER") {
                echo "<tr>";
                echo "<td style='text-align: center;'>" . $attributes['NAME'] . "</td>";        // Skriver ut tidningens namn
                echo "<td colspan='2' style='text-align: center;'>" . $attributes['SUBSCRIBERS'] . " Subsribers " . $attributes['TYPE'] . "</td>"; // Skriver ut tidningens prenumeranter och dess edition 
                echo "<td>";
            } else if ($entityname == "ARTICLE") {
                echo "<table style='padding:5px; margin:10px; text-align: center; box-shadow: 2px 2px;";
                if ($attributes['DESCRIPTION'] == "News") {         // Om en artikel är en nyhetsartikel ska den färgas beige, annars ska den vara grön.
                    echo " background-color: #ebdfc0;'>";
                }
                else {
                    echo " background-color: #c0ebd1;'>";
                }
                echo "<td style='text-align: left;'>" . $attributes['ID'] . ", " . $attributes['TIME'] . " " . $attributes['DESCRIPTION'] . "</td>";        // Skriver ut artikelns ID, datum och typ
                echo "<td>";
            } else if ($entityname == "HEADING") {
                echo "<tr>";
                echo "<td>";
                echo "<h3>";
            } else if ($entityname == "STORY") {
                echo "<tr>";
                echo "<td>";
                echo "<div>";
            }  else if ($entityname == "TEXT") {
                
            } else if ($entityname == "COMMENT") {
            } 

            if($entityname != "TEXT") {         // Så länge entiteten inte är TEXT, överför datan till den globala variablen $paragraphs
                $paragraphs=$entityname;
            }
        }
        function endElement($parser, $entityname)
        {
            if ($entityname == "ARTICLES") {
                echo "</table>";
            } else if ($entityname == "NEWSPAPER") {
                echo "</tr>";
                /* echo "</td>"; */
            } else if ($entityname == "ARTICLE") {
                echo "</td>";
                echo "</td>";
                echo "</table>";
            } else if ($entityname == "HEADING") {
                echo "</h3>";
                echo "</td>";
                echo "</tr>";
            } else if ($entityname == "STORY") {
                echo "</div>";
                echo "</td>";
                echo "</tr>";
            } else if ($entityname == "TEXT") {
            } else if ($entityname == "COMMENT") {
            } 
        }
        function charData($parser, $chardata)
        {
            global $paragraphs;
            $chardata = trim($chardata);
            if ($chardata == "") return;
            if ($paragraphs=="STORY"){              // Om $paragraph lagrar STORY, skriv ut all text i <p>-taggar, annars ignorera
                echo  "<p>" . $chardata . "</p>";
            }else {
                echo $chardata;
            }   
        }
        $parser = xml_parser_create();
        xml_set_element_handler($parser, "startElement", "endElement");
        xml_set_character_data_handler($parser, "charData");
        if (isset($_POST['newsEdition'])) {
            $edition = $_POST['newsEdition'];
            $url = "https://wwwlab.webug.se/examples/XML/articleservice/articles?paper=" . $edition;
            $data = file_get_contents($url);
            if (!xml_parse($parser, $data, true)) {
                printf(
                    "<P> Error %s at line %d</P>",
                    xml_error_string(xml_get_error_code($parser)),
                    xml_get_current_line_number($parser)
                );
            } else {
            }
        } else {
            echo "The news edition is not set.";
        }
        xml_parser_free($parser);
        echo "</table>";
        ?>
</body>
<html>