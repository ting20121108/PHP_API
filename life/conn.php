<?php
    $server = "localhost";
    $username = "root";
    $password = 'mysql1passwd';
    $db_name = 'life';
    $conn = new mysqli($server, $username, $password, $db_name);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>