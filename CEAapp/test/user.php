<?php

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

class User{
    // function getUsers(){
    //     include "connection.php";



    //     $sql = "SELECT usr_id, usr_username, usr_fullname FROM users ORDER BY usr_fullname";
    //     $stmt = $conn->prepare($sql);
    //     $stmt -> execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = $stmt->fetchAll(PDO::FETCH_ASSOC);
    //     }
    //     return json_encode($returnValue);
    // }

    // function signup($json){
    //     include "connection.php";

    //     $json = json_decode($json, true);
    //     $no = $json["no"];
    //     $fname = $json["fname"];
    //     $fmname = $json["fmname"];
    //     $flname = $json["flname"];
    //     $email = $json["email"];
    //     $address= $json["address"];
    //     $gender = $json["gender"];
    //     $contact = $json["contact"];
    //     $password = $json["password"];
    //     $relation = $json["relation"];


    //     $sql = "INSERT INTO user(stud_no, stud_fname, stud_mname, stud_lname, stud_email, stud_address, stud_gender, stud_contact, stud_password, stud_relation)";
    //     $sql .= "VALUES(:no, :fname, :fmname, :flname, :email, :address, :gender, :contact, :password, :relation)";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":no", $no);
    //     $stmt->bindParam(":fname", $fname);
    //     $stmt->bindParam(":fmname", $fmname);
    //     $stmt->bindParam(":flname", $flname);
    //     $stmt->bindParam(":email", $email);
    //     $stmt->bindParam(":address", $address);
    //     $stmt->bindParam(":gender", $gender);
    //     $stmt->bindParam(":contact", $contact);
    //     $stmt->bindParam(":password", $password);
    //     $stmt->bindParam(":realation", $relation);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = 1;
    //     }
    //     $stmt = null;
    //     $conn = null;
    //     return $returnValue;
    // }



    // function dataInput1($json){
    //     include "connection.php";

    //     $json = json_decode($json, true);
    //     $dep1 = $json["dep1"];
        


    //     $sql = "INSERT INTO tbl_course(course_name)";
    //     $sql .= "VALUES(:dep1)";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":dep1", $dep1);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = 1;
    //     }
    //     $stmt = null;
    //     $conn = null;
    //     return $returnValue;
    // }

    // function yeardataInput($json){
    //     include "connection.php";

    //     $json = json_decode($json, true);
    //     $year = $json["year"];
        


    //     $sql = "INSERT INTO tbl_year(year_level)";
    //     $sql .= "VALUES(:year)";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":year", $year);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = 1;
    //     }
    //     $stmt = null;
    //     $conn = null;
    //     return $returnValue;
    // }

    // function facdataInput($json){
    //     include "connection.php";

    //     $json = json_decode($json, true);
    //     $facFname = $json["facFname"];
    //     $facMname = $json["facMname"];
    //     $facLname = $json["facLname"];
    //     $facEmail = $json["facEmail"];
    //     $facPhone = $json["facPhone"];
    //     $facUsr = $json["facUsr"];
    //     $facPass = $json["facPass"];
    //     $facAddress = $json["facAddress"];
    //     $facGender = $json["facGender"];
    //     $facRelation = $json["facRelation"];
        


    //     $sql = "INSERT INTO tbl_employee(emp_fname, emp_mname, emp_lname, emp_email, emp_phone, emp_username, emp_password, emp_address, emp_gender, emp_relation)";
    //     $sql .= "VALUES(:facFname, :facMname, :facLname, :facEmail, facPhone, :facUsr, :facPass, :facAddress, :facGender, :facRelation)";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":facFname", $facFname);
    //     $stmt->bindParam(":facMname", $facMname);
    //     $stmt->bindParam(":facLname", $facLname);
    //     $stmt->bindParam(":facEmail", $facEmail);
    //     $stmt->bindParam(":facPhone", $facPhone);
    //     $stmt->bindParam(":facUsr", $facUsr);
    //     $stmt->bindParam(":facPass", $facPass);
    //     $stmt->bindParam(":facAddress", $facAddress);
    //     $stmt->bindParam(":facGender", $facGender);
    //     $stmt->bindParam(":facRelation", $facRelation);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = 1;
    //     }
    //     $stmt = null;
    //     $conn = null;
    //     return $returnValue;
    // }

    // function input($json) {
    //     include "connection.php";
    
    //     $json = json_decode($json, true);
    //     $data_usrId = $json["data_usrId"];
    //     $event = $json["event"];
    //     $venue = $json["venue"];
    //     $date = $json["date"];
    
    //     // Perform an inner join to fetch user data
    //     $sql = "INSERT INTO datatable (data_usrId, data_event, data_venue, data_date)
    //             SELECT u.usr_id, :event, :venue, :date
    //             FROM users u
    //             WHERE u.usr_fullname = :data_usrId";
        
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(':data_usrId', $data_usrId);
    //     $stmt->bindParam(':event', $event);
    //     $stmt->bindParam(':venue', $venue);
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




    // function getData(){
    //     include "connection.php";

    //     $decodeJson = json_decode($json, true);
    //     $userId = $decodeJson['userId'];

    //     $sql = "SELECT a.* FROM datatable a INNER JOIN users b ON a.data_usrId = b.usr_id";
    //     $sql .= "WHERE a.data_usrId = :userId";
    //     $sql .= "ORDER BY a.data_event";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":userId", $userId);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }

    function getTest(){
        include "connection.php";


        $sql = "SELECT test_type FROM tbl_test";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    // function getDepartment(){
    //     include "connection.php";


    //     $sql = "SELECT course_name FROM tbl_course";
    //     $stmt = $conn->prepare($sql);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }

    // function getQuestions(){
    //     include "connection.php";

    //     // $decodeJson = json_decode($json, true);
    //     // $userId = $decodeJson['userId'];

    //     $sql = "SELECT a.* FROM tbl_question a INNER JOIN tbl_subject b ON a.question_id = b.subject_id";
    //     // $sql .= "WHERE a.question_id = :userId";
    //     // $sql .= "ORDER BY a.question_text";
    //     $stmt = $conn->prepare($sql);
    //     // $stmt->bindParam(":userId", $userId);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }

    function getQuestions(){
        include "connection.php";


        $sql = "SELECT question_text, question_optionA, question_optionB, question_optionC, question_optionD, question_answer  FROM tbl_question";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

  

    // function getUserInfo(){
    //     include "connection.php";


    //     $sql = "SELECT user_gender, user_bday, user_address, user_mobile, user_cName, user_cNumber FROM user";
    //     $stmt = $conn->prepare($sql);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }


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



    function studentLogin($json){
        include 'connection.php';

        $decodeJson = json_decode($json, true);
        $studUsr = $decodeJson['studUsr'];
        $studPass = $decodeJson['studPass'];
        
        $sql = 'SELECT stud_id,stud_no, stud_fname, stud_mname, stud_lname FROM tbl_students WHERE stud_no=:studUsr AND stud_password = :studPass';
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':studUsr', $studUsr);
        $stmt->bindParam(':studPass', $studPass);
        $stmt->execute();
        $returnValue = 0;
        if ($stmt->rowCount() > 0) {
            $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }
    // function Adminlogin($json){
    //     include 'connection.php';

    //     $decodeJson = json_decode($json, true);
    //     $adminUsr = $decodeJson['adminUsr'];
    //     $adminPass = $decodeJson['adminPass'];
        
    //     $sql = 'SELECT admin_id, admin_usr, admin_pass FROM admintable WHERE admin_usr=:adminUsr AND admin_pass = :adminPass';
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(':adminUsr', $adminUsr);
    //     $stmt->bindParam(':adminPass', $adminPass);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if ($stmt->rowCount() > 0) {
    //         $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
    //     }
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }
    // function Adminlogin($json){
    //     include 'connection.php';

    //     $decodeJson = json_decode($json, true);
    //     $empUsr = $decodeJson['empUsr'];
    //     $empPass = $decodeJson['empPass'];
        
    //     $sql = 'SELECT emp_id, emp_username, emp_password FROM tbl_employee WHERE emp_username=:empUsr AND emp_password = :empPass';
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(':empUsr', $empUsr);
    //     $stmt->bindParam(':empPass', $empPass);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if ($stmt->rowCount() > 0) {
    //         $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
    //     }
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }



    // function userStatus($json){
    //     include "connection.php";

    //     $json = json_decode($json, true);
    //     $name = $json["name"];
    //     $payment = $json["payment"];
    //     $amount = $json["amount"];
        


    //     $sql = "INSERT INTO usertable(u_userName, u_payment, u_amount)";
    //     $sql .= "VALUES(:name, :payment, :amount)";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":name", $name);
    //     $stmt->bindParam(":payment", $payment);
    //     $stmt->bindParam(":amount", $amount);
    //     $stmt->execute();
    //     $returnValue = 0;
    //     if($stmt->rowCount() > 0){
    //         $returnValue = 1;
    //     }
    //     $stmt = null;
    //     $conn = null;
    //     return $returnValue;
    // }

    function getSubject(){
        include "connection.php";


        $sql = "SELECT subject_code, subject_name FROM tbl_subject";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    function getScore(){
        include "connection.php";


        $sql = "SELECT result_score, result_date FROM tbl_result";
        $stmt = $conn->prepare($sql);
        $stmt -> execute();
        $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
        $stmt = null;
        $conn = null;
        
        echo json_encode($returnValue);
    }

    // function getQuestion1(){
    //     include "connection.php";

    //     // {"userId":"1"}
    //     $decodeJson = json_decode($json, true);
    //     $userId = $decodeJson['userId'];

    //     $sql = "SELECT a.* FROM tbl_question a INNER JOIN tbl_subject b ON a.subject_id = b.subject_id";
    //     $sql .= "WHERE a.subject_id = :userId";
    //     $sql .= "ORDER BY a.question_text";
    //     $stmt = $conn->prepare($sql);
    //     $stmt->bindParam(":userId", $userId);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }

    // function getYear(){
    //     include "connection.php";


    //     $sql = "SELECT year_level FROM tbl_year";
    //     $stmt = $conn->prepare($sql);
    //     $stmt -> execute();
    //     $returnValue = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    //     $stmt = null;
    //     $conn = null;
        
    //     echo json_encode($returnValue);
    // }


   

}





// function useryawa($json){
//     include "connection.php";

//     $json = json_decode($json, true);
//     $name = $json["name"];
//     $course= $json["course"];
//     $ite368 = $json["ite368"];
//     $ite214 = $json["ite214"];
//     $ite666 = $json["ite666"];
    
//     $sql = "INSERT INTO tblyawa(name, course, ite368, ite214, ite666)";
//     $sql .= "VALUES(:name, :course, :ite368, ite214, ite666)";
//     $stmt = $conn->prepare($sql);
//     $stmt->bindParam(":name", $name);
//     $stmt->bindParam(":course", $course);
//     $stmt->bindParam(":ite368", $ite368);
//     $stmt->bindParam(":ite214", $ite214);
//     $stmt->bindParam(":ite666", $ite666);
//     $stmt->execute();
//     $returnValue = 0;
//     if($stmt->rowCount() > 0){
//         $returnValue = 1;
//     }
//     $stmt = null;
//     $conn = null;
//     return $returnValue;
// }











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
    case "dataInput1":
        echo $user->dataInput1($json);
        break;
    case "yeardataInput":
        echo $user->yeardataInput($json);
        break;
    case "facdataInput":
        echo $user->facdataInput($json);
        break;
    case "input":
        echo $user->input($json);
        break;
    case "studentLogin":
        echo $user->studentLogin($json);
        break;
    case "getData":
        echo $user->getData($json);
        break;
    case "getTest":
        echo $user->getTest($json);
        break; 
    case "getDepartment":
        echo $user->getDepartment($json);
        break; 
    case "getQuestions":
        echo $user->getQuestions($json);
        break; 
        case "getUserInfo":
            echo $user->getUserInfo($json);
            break; 
    case "Adminlogin":
        echo $user->Adminlogin($json);
        break;
    case "getSubject":
        echo $user->getSubject($json);
        break;
    case "getScore":
        echo $user->getScore($json);
        break;
    case "getQuestion1":
        echo $user->getQuestion1($json);
        break;
    case "getYear":
        echo $user->getYear($json);
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