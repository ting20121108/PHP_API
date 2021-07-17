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
        $insertResult = $dbHelper->insert($name, $email, $passwd);
        if ($insertResult == 1) {
            print("success");
        } else {
            print("failure");
        }
    }

    // print ("name = " . $name);
    // print ("email = " . $email);
    // print ("passwd = " . $passwd);
    // print ("passwdck = " . $passwdck);

    // $sql = "'INSERT INTO member_info (group_no, member_nickname, email, passwd)
    //          VALUES ('1', '$name', '$email', '$passwd')'";

    // if (!$conn->query($sql)) {
    //     echo "failure";
    // } else {
    //     echo "success";
    // }
}
