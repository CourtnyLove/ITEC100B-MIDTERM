<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lab Activity 3 - Forgot Password</title> 

    <meta charset="UTF-8">
    <link rel="stylesheet" href="styless.css"/>
    <meta name="viewport" content="width-device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <style>
        h3{
            z-index: 1;
            color: black;
        }
        a{
            margin-left: 0%;
            color: blue;
        }
    </style>
</head>  
<body>
                
    <div class="wrapper">
        <div class="form">
            <h1 id="hhhh"> CHANGE PASSWORD </h1>
            <form action="" method="post" name="login">
            <div class="container">
                <form class="form group" action="/authenticator.php">
                    <input class="text1" id="username" type="text" name="username" placeholder="Username"><br>
                    <input class="text1" id="newpassword" type="password" name="newpassword" placeholder="New Password">
                    <input class="text1" id="confirmpassword" type="password" name="confirmpassword" placeholder="Confirm Password">
                </form>
                <br><br>
                <center><button type="submit" class="btn1" method="post" name="changepassword">Change Password</button>
                <button type="button" class="btn1" name="register" onclick="window.location.href='index.php'">Cancel</button>
                </center>          

            </div>
        </div>
    </div>

</body>

<!--<?php 
session_start();
  
require_once "config.php";

$_SESSION["verify"] = false;
$_SESSION["code_access"] = false;
 
if($_SERVER["REQUEST_METHOD"] == "POST"){
  
    if(empty(trim($_POST["username"]))){
        echo "<h3>Username is empty.</h3><a href='Login.php'></a>";
    } else{
        $username = trim($_POST["username"]);
    }
     
    if(empty(trim($_POST["password"]))){
        echo "<h3>Password is empty.</h3><a href='Login.php'></a>";
    } else{
        $password = trim($_POST["password"]);
    }
     
    if(empty($username_err) && empty($password_err)){ 
        $sql = "SELECT id, username, password FROM users WHERE username = ?";
        
        if($stmt = mysqli_prepare($con, $sql)){ 
            mysqli_stmt_bind_param($stmt, "s", $param_username);
             
            $param_username = $username;
             
            if(mysqli_stmt_execute($stmt)){ 
                mysqli_stmt_store_result($stmt);
                 
                if(mysqli_stmt_num_rows($stmt) == 1){ 
                    mysqli_stmt_bind_result($stmt, $id, $username, $hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if(password_verify($password, $hashed_password)){

                            $_SESSION["verify"] = true;
                            $_SESSION["code_access"] = true;
                            
                            $_SESSION["id"] = $id;

                            $link = "<script>window.open('http://localhost/authenticator.php')</script>"; 
                            echo $link; 

                        } else{                              
                            echo "<h3>Password is incorrect.</h3>";
                        }
                    }
                } else{ 
                    echo "<h3>Username is incorrect.</h3>";
                }
            } else{
                echo "<h3>Something went wrong.</h3>";
            }
            mysqli_stmt_close($stmt);
        }
    }
    mysqli_close($con);
}
?>-->

<?php
    include 'config.php';

    $_SESSION["verify"] = false;
    $_SESSION["code_access"] = false;

    if (isset($_POST['username'])){
        
        $username = stripslashes($_REQUEST['username']); // removes backslashes
        $username = mysqli_real_escape_string($con,$username); //escapes special characters in a string
        
        $newpassword = stripslashes($_REQUEST['newpassword']);
        $newpassword = mysqli_real_escape_string($con,$newpassword);

        $confirmpassword = stripslashes($_REQUEST['confirmpassword']);
        $confirmpassword = mysqli_real_escape_string($con,$confirmpassword);

        date_default_timezone_set('Asia/Manila');
          $currentDate = date('Y-m-d H:i:s');
          $currentDate_timestamp = strtotime($currentDate);
          $_SESSION["current"] = $currentDate;


        if (empty($username)) {
            echo "<h3>Username is Required.</h3>";
        }else if(empty($newpassword)){
            echo "<h3>New Password is Required.</h3>";  
        }else if(empty($confirmpassword)){
            echo "<h3>Confirmation Password is Required.</h3>";
        }

        if($newpassword !== $confirmpassword){
            echo "<h3>Confirmation Password does not match.</h3>";
        }else if (strlen($newpassword)<=8){
            echo "<h3>Password is atleast 8 characters. </h3>";
        }else if(!preg_match("#[A-Z]+#",$newpassword)) {
            echo "<h3>Password must contain at least 1 upper case.</h3>";
        }else if(!preg_match("#[a-z]+#",$newpassword)){
            echo "<h3>Password must contain at least 1 lower case.</h3>";
        }else if(!preg_match("#[0-9]+#",$newpassword)){
            echo "<h3>Password must contain at least 1 number.</h3>";
        }else if(!preg_match("#[\W]+#",$newpassword))  {
            echo "<h3>Password must contain at least 1 special character.</h3>";
        }
        else{
            $query ="UPDATE `users`  SET password = '$newpassword' WHERE username = '$username'";
            $result = mysqli_query($con,$query) or die(mysql_error());

            $_SESSION["verify"] = true;
            $_SESSION["code_access"] = true;
            $_SESSION["id"] = $id;
            $_SESSION["username"] = $username;

            $user_id = $_SESSION["id"];
            $user_name = $_SESSION["username"];

            $sql = "INSERT INTO `userlog` (user_id, username, activity, dateandtime) VALUES ('$user_id', '$user_name', 'Changed Password', '$currentDate')";
            $result = mysqli_query($con, $sql);

            echo "<h3>Password Changed.Go to<a href='index.php'>  Login <a></h3>";
            //header("location: ../authentication/index.php");
        }

    }else{

    }
?>

</html>