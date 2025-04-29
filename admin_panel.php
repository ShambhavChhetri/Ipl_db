<?php
session_start();

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="admin_style.css">
</head>
<body>

<h1>Welcome to Admin Panel</h1>

<nav>
    <a href="index.php">Home</a> |
    <a href="logout.php" style="color:red;">Logout</a>
</nav>

<p>Here you can manage matches, points, teams, etc.</p>

</body>
</html>
