<html>
    <body>
        <?php
            if (isset($_POST["formProgram"])) {
                $paper = $_POST['formProgram'];
            } else {
                $paper = "Emptyy";
            }
            echo $paper;
        ?>
    </body>
</html>