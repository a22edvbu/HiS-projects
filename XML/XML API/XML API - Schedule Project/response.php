<html>
    <body>
    <?php
            if (isset($_POST["formProgram"])){
                $Program = $_POST['formProgram'];
            } else {
                $Program = "";
            }
            if (isset($_POST["formDepartment"])) {
                $formDepartment2 = $_POST['formDepartment'];
            } else {
                $formDepartment2 = "";
            }
            echo $formDepartment2;
            echo $Program;

            $xml = file_get_contents("https://wwwlab.webug.se/examples/XML/scheduleservice/courses/?department=" . $formDepartment2);
            $dom = new DomDocument;
            $dom->preserveWhiteSpace = FALSE;   
            $dom->loadXML($xml);

            echo "<table border=1>";
                echo "<tr>";
                    echo "<th>Kurs</th>";
                    echo "<th>Sal</th>";
                    echo "<th>Klasser</th>";
                    echo "<th>Typ</th>";
                    echo "<th>Tid</th>";
                echo "</tr>";
                $schedules = $dom->getElementsByTagName("course");
                foreach ($schedules as $schedules){

                }
            echo "</table>";
        ?>
    </body>
</html> 