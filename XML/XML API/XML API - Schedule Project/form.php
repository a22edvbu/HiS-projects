<html>
    <body>
        <form method='POST' action="form.php">
            <?php
            $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/scheduleservice/programs/");
            $dom = new DomDocument;
            $dom->preserveWhiteSpace = FALSE;
            $dom->loadXML($xml);
            echo "<select name='formDepartment'>";
            $formDepartments = $dom->getElementsByTagName("program");
            foreach ($formDepartments as $formDepartment) {
                /* echo $newspaper->getAttribute("NAME"); */
                echo "<option value='" . $formDepartment->getAttribute("department") . "'>";
                echo $formDepartment->getAttribute("department");
                echo "</option>";
            }
            echo $formDepartment->getAttribute("department");   
            echo "</select>";
            if (isset($_POST["formDepartment"])) {
                $formDepartment2 = $_POST['formDepartment'];
            } else {
                $formDepartment2 = "Empty";
            }
            ?>
            <button>Send Department</button>
        </form>

            <?php
            /* echo $formDepartment; */
            if (isset($_POST["formDepartment"])) {
                echo "<form method='POST' action='response.php'>";
                $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/scheduleservice/programs/?department=" . $formDepartment2);
                $dom = new DomDocument;
                $dom->preserveWhiteSpace = FALSE;   
                $dom->loadXML($xml);
                echo "<select name='formProgram'>";
                $formPrograms = $dom->getElementsByTagName("program");
                foreach ($formPrograms as $formProgram) {
                    /* echo $newspaper->getAttribute("NAME"); */
                    echo "<option value='" . $formProgram->getAttribute("id") . "'>";
                    echo $formProgram->getAttribute("name");
                    echo "</option>";
                }
                echo $formProgram->getAttribute("id");   
                echo "</select>";   
                echo "<button>Send Program :)</button>";
                echo "</form>";
            } else {
                echo "Välj en linje.";
            }

                ?>


</body>
</html> 