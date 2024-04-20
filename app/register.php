<?php
// create user in database, remove this file after use

$host = "db";
$username = "matt";
$password = "password";
$database = "ams_native";
$config = mysqli_connect($host, $username, $password, $database);

if (!$config) {
  die("Koneksi database gagal: " . mysqli_connect_error());
}

// md5 hash
$hash = md5("password");

// insert user
$query = mysqli_query($config, "INSERT INTO tbl_user (username, password, nama, nip, admin) VALUES ('matt', '$hash', 'Matt', '1980', 1)");

if ($query) {
  echo "User berhasil ditambahkan";
} else {
  echo "User gagal ditambahkan";
}
