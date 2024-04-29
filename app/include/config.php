<?php
$host = "db";
$username = "matt";
$password = "password";
$database = "ams_native";
$config = mysqli_connect($host, $username, $password, $database);

if (!$config) {
  die("Koneksi database gagal: " . mysqli_connect_error());
}

$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_error) {
  die("Connection failed: " . $mysqli->connect_error);
}
