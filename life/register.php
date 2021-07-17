<?php
require_once 'DBHelper.php';
require_once 'validate.php';

/** @var \DBHelper $dbHelper 存取與資料庫相關功能的物件 */
$dbHelper = new DBHelper();

if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['passwd']) && isset($_POST['passwdck'])) {

    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $passwd = validate($_POST['passwd']);
    $passwdck = validate($_POST['passwdck']);

    if (
        !empty($name) && !empty($email) && !empty($passwd)
    ) {
        $emailCheck = $dbHelper->emailCheck($email);
        if($emailCheck != true){
            print("email is exist");
        }else{
            $insertResult = $dbHelper->insert($name, $email, $passwd);
            if ($insertResult == 1) {
                print("success");
            } else {
                print("failure");
            }
        }
    }
}
