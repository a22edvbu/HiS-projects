<html>
    <body>
        <form method='POST' action="response.php">
            <?php
            $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/scheduleservice/programs/");
            $dom = new DomDocument;
            $dom->preserveWhiteSpace = FALSE;
            $dom->loadXML($xml);
            echo "<select name='formProgram'>";
            $programs = $dom->getElementsByTagName("program");
            foreach ($programs as $program) {
                /* echo $newspaper->getAttribute("NAME"); */
                echo "<option value='" . $program->getAttribute("id") . "'>";
                echo $program->getAttribute("name");
                echo "</option>";
            }
            echo $program->getAttribute("id");   
            echo "</select>";
            ?>
            <button>Send</button>
        </form>
    </body>
</html>