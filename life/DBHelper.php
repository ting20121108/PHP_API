<?php

    /**
     * 資料庫相關類別
     *
     * 包含所有與資料庫相關的功能
     */
    class DBHelper
    {
        /** @var string $host 資料庫主機名稱 */
        private $host  = 'localhost';
        /** @var string $user 使用者名稱 */
        private $user = 'root';
        /** @var string $password 密碼 */
        private $password = 'tp6vup4cj/6';
        /** @var string $db 資料庫名稱 */
        private $db = 'life';
        /** @var object $connect 資料庫連線 */
        public $connect;
        /** @var mixed $result 資料庫變動後的結果 */
        public $result;

        /**
         * 建構子
         *
         * 連接資料庫並設定字符編碼，若連接錯誤會出現連接錯誤的訊息
         *
         * @return void
         */
        public function __construct()
        {
            $this->connect = new mysqli(
                $this->host,
                $this->user,
                $this->password,
                $this->db
            );
            mysqli_set_charset($this->connect, "utf8mb4");

            if ($this->connect->connect_error) {
                die("Connection failed: " . $this->connect->connect_error);
            }
        }

        // /**
        //  * 取得資料表中符合欄位的資料
        //  *
        //  * @var string $sql 查詢資料表中 id, name, content, time欄位的資料
        //  *
        //  * @return object
        //  */
        // public function getList()
        // {
        //     $sql = 'SELECT id, name, content, time FROM message_board';
        //     $result = mysqli_query($this->connect, $sql);

        //     return $result;
        // }

        /**
         * 新增帳號
         *
         * @param string $name 暱稱
         * @param string $email 信箱
         * @param string $passwd 密碼
         *
         * @var string $sql 新增使用者到資料表中
         *
         * @return mixed
         */
        public function insert($name, $email, $passwd)
        {
            $sql = "INSERT INTO member_info(group_no, member_nickname, email, passwd)
                    VALUES ('1', '$name', '$email', '$passwd')";
            // $sql = "INSERT INTO message_board(name, content) value('$name', '$content')";
            mysqli_query($this->connect, $sql);
            $result = $this->connect->affected_rows;
            if($result != 1){
                return false;
            }else{
                return $result;
            }
        }

        /**
         * 登入系統
         *
         * @param string $email 信箱
         * @param string $passwd 密碼
         *
         * @var string $sql 查找帳號
         *
         * @return mixed
         */
        public function login($email, $passwd)
        {
            $sql = "SELECT 'name', 'email' FROM member_info WHERE email='$email' AND passwd='$passwd'";
            mysqli_query($this->connect, $sql);
            $result = $this->connect->affected_rows;
            if($result != 1){
                return false;
            }else{
                return $result;
            }
        }

        public function emailCheck($email)
        {
            $sql = "SELECT 'email' FROM member_info WHERE email='$email'";
            mysqli_query($this->connect, $sql);
            $result = $this->connect->affected_rows;
            if($result != 0){
                return false;
            }else{
                return true;
            }
        }

        /**
         * 解構子
         *
         * 關閉資料庫
         *
         * @return void
         */
        public function __destruct()
        {
            $this->connect->close();
        }
    }
