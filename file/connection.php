<?php
$servername = "localhost";
$username = "root";
$password = "password1";
$dbname = "bloodbank";
$conn = new mysqli($servername, $username, $password, $dbname);
if(!$conn){
 die('Could not Connect MySql:' .mysql_error());
}
?>
