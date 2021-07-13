<?php
    if(isset($_POST['name']) && isset($_POST['email']) && isset($_POST['passwd']) && isset($_POST['passwdck'])){
        require_once 'conn.php';
        require_once 'validate.php';
        $name = validate($_POST['name']);
        $email = validate($_POST['email']);
        $passwd = validate($_POST['passwd']);
        $passwdck = validate($_POST['passwdck']);
        $sql = "INSERT INTO member_info VALUES ('', '1', '$name', '$email', '$passwd', '', '', '', '', '')";
        if(!$conn->query($sql)){
            echo "failure";
        }else{
            echo "success";
        }
    }
?>