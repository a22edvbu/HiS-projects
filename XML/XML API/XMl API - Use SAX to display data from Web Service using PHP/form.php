<html>

<body>
    <form method="POST" action="response.php">
        <?php

        function startElement($parser, $entityname, $attributes)
        {
            if ($entityname == "NEWSPAPER") {
                echo "<option value='" . $attributes['TYPE'] . "'>";        // Skapar alternativen i dropdownmenyn
                echo $attributes['NAME'];
            }
            else if ($entityname == "NEWSPAPERS") {
                echo "<select name='newsEdition'>";
            }
        }

        function endElement($parser, $entityname)
        {
            if ($entityname == "NEWSPAPERS") {
                echo "</select>";
                echo "<button>Search</button>";
            }
            else if ($entityname == "NEWSPAPER") {
                echo "</option>";
            }
        }

        function charData($parser, $chardata)
        {
        }
        $parser = xml_parser_create();
        xml_set_element_handler($parser, "startElement", "endElement");
        xml_set_character_data_handler($parser, "charData");

        $url = "https://wwwlab.webug.se/examples/XML/articleservice/papers/";
        $data = file_get_contents($url);
        if (!xml_parse($parser, $data, true)) {

            printf(
                xml_error_string(xml_get_error_code($parser)),
                xml_get_current_line_number($parser)

            );
        } else {
        }

        xml_parser_free($parser);

        ?>

    </form>
</body>

</html>