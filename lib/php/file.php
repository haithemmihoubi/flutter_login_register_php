<?php

$host = "localhost";
$database = "id16738121_test";
$user = "id16738121_haithem";
$pass = "5XD2J06pt/6OELkB";
try {
    $db = new PDO("mysql:host=" . $host . ";dbname=" . $database, $user, $pass);
} catch (Exception $e) {
    echo $e->getMessage();
}


$user = $_POST['user'];
$age = $_POST['age'];
$pass = $_POST['pass'];




try {
    $query = $db->prepare("SELECT * FROM users WHERE nom=?");
    $query->execute(array($user));
    $exist = $query->rowCount();
    if ($exist == 0) {
        $pass = sha1($pass);
        $query = $db->prepare("INSERT INTO users(nom,age,pass) VALUES(?,?,?)");
        $query->execute(array($user, $age, $pass));

        $msg["statut"] = "Utilisateur enregistrer avec succes";
    } else {
        $msg["statut"] = "Nom d'utilistateur deja attribue";
    }
} catch (Exception $e) {
    $msg["statut"] = "Erreur d'enregistrement";
}
echo json_encode($msg);
