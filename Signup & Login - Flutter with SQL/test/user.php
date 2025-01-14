<?php

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

class User{
    function getUsers(){
        include "connection.php";



        $sql = "SELECT usr_id, usr_username, usr_fullname FROM users ORDER BY usr_fullname";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = 0;
        if($stmt->rowCount() > 0){
            $returnValue = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        return json_encode($returnValue);
    }

    function signup($json){
        include "connection.php";

        $json = json_decode($json, true);
        $username = $json["username"];
        $password = $json["password"];
        $fullname = $json["fullname"];


        $sql = "INSERT INTO users(usr_username, usr_password, usr_fullname)";
        $sql .= "VALUES(:username, :password, :fullname)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":username", $username);
        $stmt->bindParam(":password", $password);
        $stmt->bindParam(":fullname", $fullname);
        $stmt->execute();
        $returnValue = 0;
        if($stmt->rowCount() > 0){
            $returnValue = 1;
        }
        $stmt = null;
        $conn = null;
        return $returnValue;
    }

    function login($json){
        include 'connection.php';

        $decodeJson = json_decode($json, true);
        $username = $decodeJson['username'];
        $password = $decodeJson['password'];
        
        $sql = 'SELECT usr_id, usr_username, usr_fullname FROM users WHERE usr_username=:username AND usr_password = :password';
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        $stmt->execute();
        $returnValue = 0;
        if ($stmt->rowCount() > 0) {
            $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

}

$json = isset($_POST['json']) ? $_POST['json'] : "";
$operation = $_POST['operation'];

$user = new User();
switch($operation){
    case "getUsers":
        echo $user->getUsers($json);
        break;
    case "signup":
        echo $user->signup($json);
        break;
    case "login":
        echo $user->login($json);
        break;
}






?>