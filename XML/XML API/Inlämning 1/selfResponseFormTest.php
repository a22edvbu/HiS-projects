<html>
<body>
  
<form action='selfResponseFormTest' method='POST'>
    <div><label>Textbox:</label><input type='text' name='textbox'></div>
    <div>
        <label>Selectbox:</label>
        <select name='selectbox'>
            <option value='AOpt'>First Option</option>
            <option value='BOpt'>Second Option</option>
            <option value='COpt'>Third Option</option>        
        </select>
    </div>
    <div><button >Skicka!</button></div>
</form>
 
<?php
  echo "<div>In selectbox: ";
  if(isset($_POST['selectbox'])){
      echo $_POST['selectbox'];
  }
  echo "</div>";
  print_r($_POST);
?>
  
</body>
</html>