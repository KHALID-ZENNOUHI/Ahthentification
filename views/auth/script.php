<?php
include __DIR__.'/../../database/connection.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    extract($_POST);
    $pass = password_hash($password, PASSWORD_BCRYPT);
    $sql = "SELECT * FROM user WHERE username = '$username' and fullname = '$fullname'";
    $sqlconn = mysqli_query($conn, $sql);
    if (mysqli_num_rows($sqlconn) > 0) {
        echo "Use another username and fullname";
    } else {
        $sqladd = "INSERT INTO user (`username`, `fullname`, `password`, `role_id`) VALUES ('$username', '$fullname', '$pass', 2)";
        mysqli_query($conn, $sqladd);
        header('location: login.php');
    }
}


if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    extract($_POST);
    $sql = "SELECT * FROM user WHERE username = '$username'";
    $sqlconn = mysqli_query($conn, $sql);

    if (mysqli_num_rows($sqlconn) > 0) {
        $row = mysqli_fetch_assoc($sqlconn);
        if (password_verify($password, $row['password'])) {
            $_SESSION['role_id'] = $row['role_id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['id'] = $row['id'];
            if ($row['role_id'] == 1) {
                header('location: ../admin/dashboard.php');
            }else header('location: ../admin/user.php');
            
        } else {
            echo "Your password is incorrect";
        }
    } else {
        echo "The username is undefined";
    }
}


    ?>