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
        $firstname = $json["firstname"];
        $lastname = $json["lastname"];
        $username = $json["username"];
        $password = $json["password"];
        $gender = $json["gender"];
        $bday= $json["bday"];
        $address = $json["address"];
        $mobile = $json["mobile"];


        $sql = "INSERT INTO user(user_firstName, user_lastName, user_userName, user_password, user_gender, user_bday, user_address, user_mobile)";
        $sql .= "VALUES(:firstname, :lastname, :username, :password, :gender, :bday, :address, :mobile)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":firstname", $firstname);
        $stmt->bindParam(":lastname", $lastname);
        $stmt->bindParam(":username", $username);
        $stmt->bindParam(":password", $password);
        $stmt->bindParam(":gender", $gender);
        $stmt->bindParam(":bday", $bday);
        $stmt->bindParam(":address", $address);
        $stmt->bindParam(":mobile", $mobile);
        $stmt->execute();
        $returnValue = 0;
        if($stmt->rowCount() > 0){
            $returnValue = 1;
        }
        $stmt = null;
        $conn = null;
        return $returnValue;
    }



    function dataInput($json){
        include "connection.php";

        $json = json_decode($json, true);
        $event = $json["event"];
        $venue = $json["venue"];
        $date = $json["date"];


        $sql = "INSERT INTO datatable(data_event, data_venue, data_date)";
        $sql .= "VALUES(:event, :venue, :date)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":event", $event);
        $stmt->bindParam(":venue", $venue);
        $stmt->bindParam(":date", $date);
        $stmt->execute();
        $returnValue = 0;
        if($stmt->rowCount() > 0){
            $returnValue = 1;
        }
        $stmt = null;
        $conn = null;
        return $returnValue;
    }

    function input($json) {
        include "connection.php";
    
        $json = json_decode($json, true);
        $data_usrId = $json["data_usrId"];
        $event = $json["event"];
        $venue = $json["venue"];
        $date = $json["date"];
    
        // Perform an inner join to fetch user data
        $sql = "INSERT INTO datatable (data_usrId, data_event, data_venue, data_date)
                SELECT u.usr_id, :event, :venue, :date
                FROM users u
                WHERE u.usr_fullname = :data_usrId";
        
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':data_usrId', $data_usrId);
        $stmt->bindParam(':event', $event);
        $stmt->bindParam(':venue', $venue);
        $stmt->bindParam(':date', $date);
    
        $stmt->execute();
        $returnValue = 0;
    
        if ($stmt->rowCount() > 0) {
            $returnValue = 1;
        }
    
        $stmt = null;
        $conn = null;
    
        // Return the insert status
        return $returnValue;
    }




    function getData(){
        include "connection.php";

        $decodeJson = json_decode($json, true);
        $userId = $decodeJson['userId'];

        $sql = "SELECT a.* FROM datatable a INNER JOIN users b ON a.data_usrId = b.usr_id";
        $sql .= "WHERE a.data_usrId = :userId";
        $sql .= "ORDER BY a.data_event";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":userId", $userId);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    function getEvent(){
        include "connection.php";


        $sql = "SELECT data_event, data_venue, data_date FROM datatable";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    function getUser(){
        include "connection.php";


        $sql = "SELECT u_userName, u_payment FROM usertable";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    function getUserInfo(){
        include "connection.php";


        $sql = "SELECT user_gender, user_mobile FROM user";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }


    // function Reserve($json) {
    //     include "connection.php";
    
    //     $json = json_decode($json, true);
    //     $reserve_user = $json["reserve_user"];
    //     $date = $json["date"];
    
    //     // Perform an inner join to fetch user data
    //     $sql = "INSERT INTO tblreservation (reserve_user, date)
    //             SELECT u.user_id, :date
    //             FROM tblusers u
    //             WHERE u.username = :reserve_user";
        
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(':reserve_user', $reserve_user);
    //     $stmt->bindParam(':date', $date);
    
    //     $stmt->execute();
    //     $returnValue = 0;
    
    //     if ($stmt->rowCount() > 0) {
    //         $returnValue = 1;
    //     }
    
    //     $stmt = null;
    //     $conn = null;
    
    //     // Return the insert status
    //     return $returnValue;
    // }



    function login($json){
        include 'connection.php';

        $decodeJson = json_decode($json, true);
        $username = $decodeJson['username'];
        $password = $decodeJson['password'];
        
        $sql = 'SELECT user_id, user_userName FROM user WHERE user_username=:username AND user_password = :password';
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
    function Adminlogin($json){
        include 'connection.php';

        $decodeJson = json_decode($json, true);
        $adminUsr = $decodeJson['adminUsr'];
        $adminPass = $decodeJson['adminPass'];
        
        $sql = 'SELECT admin_id, admin_usr, admin_pass FROM admintable WHERE admin_usr=:adminUsr AND admin_pass = :adminPass';
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':adminUsr', $adminUsr);
        $stmt->bindParam(':adminPass', $adminPass);
        $stmt->execute();
        $returnValue = 0;
        if ($stmt->rowCount() > 0) {
            $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }



    function userStatus($json){
        include "connection.php";

        $json = json_decode($json, true);
        $name = $json["name"];
        $payment = $json["payment"];
        


        $sql = "INSERT INTO usertable(u_userName, u_payment)";
        $sql .= "VALUES(:name, :payment)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":name", $name);
        $stmt->bindParam(":payment", $payment);
        $stmt->execute();
        $returnValue = 0;
        if($stmt->rowCount() > 0){
            $returnValue = 1;
        }
        $stmt = null;
        $conn = null;
        return $returnValue;
    }

   

}





function useryawa($json){
    include "connection.php";

    $json = json_decode($json, true);
    $name = $json["name"];
    $course= $json["course"];
    $ite368 = $json["ite368"];
    $ite214 = $json["ite214"];
    $ite666 = $json["ite666"];
    
    $sql = "INSERT INTO tblyawa(name, course, ite368, ite214, ite666)";
    $sql .= "VALUES(:name, :course, :ite368, ite214, ite666)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":name", $name);
    $stmt->bindParam(":course", $course);
    $stmt->bindParam(":ite368", $ite368);
    $stmt->bindParam(":ite214", $ite214);
    $stmt->bindParam(":ite666", $ite666);
    $stmt->execute();
    $returnValue = 0;
    if($stmt->rowCount() > 0){
        $returnValue = 1;
    }
    $stmt = null;
    $conn = null;
    return $returnValue;
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
    case "dataInput":
        echo $user->dataInput($json);
        break;
    case "input":
        echo $user->input($json);
        break;
    case "login":
        echo $user->login($json);
        break;
    case "getData":
        echo $user->getData($json);
        break;
    case "getEvent":
        echo $user->getEvent($json);
        break; 
    case "getUser":
        echo $user->getUser($json);
        break; 
        case "getUserInfo":
            echo $user->getUserInfo($json);
            break; 
    case "Adminlogin":
        echo $user->Adminlogin($json);
        break;
    case "userStatus":
        echo $user->userStatus($json);
        break;
    case "useryawa":
        echo $user->useryawa($json);
        break;
    // case "getDataInput":
    //     echo $user->getDataInput($json);
    //     break;
    // case "getData":
    //     echo $user->getData($json);
    //     break;
    
    
}






?>