<?php 
    if(isset($_POST['email']) && isset($_POST['passwd'])){
        require_once "conn.php";
        require_once "validate.php";
        $email = validate($_POST['email']);
        $passwd = validate($_POST['passwd']);
        $sql = "SELECT * FROM member_info WHERE email='$email' AND passwd='$passwd'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            echo "success";
        }else{
            echo "failure";
        }
    }
?>