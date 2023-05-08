<html>
<style>
    table,
    th,
    td {
        border: 1px solid black;
        text-align: center;
    }

    td {
        padding: 20px;
    }

    td:nth-child(odd) {
        background-color: #d1ebdb;
    }

    th {
        margin: 0 auto;
        font-size: 20px;
        background-color: #a1b5a9;
    }
</style>

<body>
    <form action='selfResponseFormTest.php' method='POST'>
        <div>
            <label>Choose manufacturer:</label>
            <select name='manuSelect'>
                <?php
                $jsontext = file_get_contents("https://wwwlab.webug.se/examples/XML/vehiclesservice/manufacturer/");
                $countryList = json_decode($jsontext);
                echo "<option value=''>  Choose... </option>";
                foreach ($countryList as $Country) {
                    echo "<option value="  .  $Country[1] . ">";
                    echo $Country[0];
                    echo "</option>";
                }
                ?>
            </select>
            <button>Apply</button>
        </div>
    </form>
    <table>
        <?php
        /* echo "<table>"; */
        if (isset($_POST['manuSelect'])) {              // Om manuSelect är tom kommer ingen tabell visas.
            $Country = $_POST['manuSelect'];
            $jsontext = file_get_contents("https://wwwlab.webug.se/examples/XML/vehiclesservice/vehicles/?country=" . $Country);
            $infoList = json_decode($jsontext);
            echo "<tr><th>Country</th><th>Company</th><th>Vehicles</th></tr>";
            foreach ($infoList as $info) {                  // $info visar företagets namn
                echo "<tr>";
                echo "<td>" . $Country . "</td>";
                echo "<td>" . $info[0] . "</td>";
                foreach ($info[1] as $specs) {              // $specs visar alla stats. Namn [0]   Config [1]   Hästkrafter [2]    Prod.[3]    Bild [4]
                    echo "<td>";
                    echo "<div> <strong> Namn: </strong>" . $specs[0] . "</div>";
                    echo "<div> <strong> Config: </strong>" . $specs[1] . "</div>";
                    if (intval(substr($specs[2], 0, -2)) > 300) {              // Om Hp är mindre än 300, skriv ut värdet med röd styliing. Om inte, skriv ut som vanligt.
                        echo "<div> <strong> Production: </strong> <span style='color: red'>" . $specs[2] . "</span>" . "</div>";
                    } else {
                        echo "<div> <strong> Production: </strong> <span>" . $specs[2] . "</span>" . "</div>";
                    }
                    echo "</span>";
                    echo "<div> <strong> Production: </strong>" . $specs[3] . "</div>";
                    echo "<div> <img src='https://wwwlab.webug.se/examples/XML/vehicleImages/" . $specs[4] . "'></div>";
                    echo "</td>";
                }
                echo "</tr>";
            }
        }
        ?>
    </table>
</body>

</html>