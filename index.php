<?php
include 'db_connect.php';
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IPL Points Table</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1> Indian Premiere League 2025</h1>

<nav>
    <a href="index.php">Home</a>
    <a href="stats.php">Stats</a>

    <?php if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true): ?>
        <a href="admin_panel.php">Admin Panel</a>
        <a href="logout.php" style="color: red;">Logout</a>
    <?php else: ?>
        <a href="login.php" style="color: green;">Admin Login</a>
    <?php endif; ?>
</nav>

<h2><center><u>Points Table</u></center></h2>

<div class="table-container">
<table>
    <thead>
        <tr>
            <th>Team</th>
            <th>Played</th>
            <th>Won</th>
            <th>Lost</th>
            <th>Points</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $query = "SELECT t.team_name, p.matches_played, p.wins, p.losses, p.points
              FROM pointstable p
              JOIN team t ON p.team_id = t.team_id
              ORDER BY p.points DESC";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['team_name']) . "</td>";
            echo "<td>" . $row['matches_played'] . "</td>";
            echo "<td>" . $row['wins'] . "</td>";
            echo "<td>" . $row['losses'] . "</td>";
            echo "<td>" . $row['points'] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No records found</td></tr>";
    }
    ?>
    </tbody>
</table>
</div>

<h2>Upcoming & Previous Matches</h2>

<div class="table-container">
<table>
    <thead>
        <tr>
            <th>Match</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $query = "SELECT m.match_id, t1.team_name AS team1, t2.team_name AS team2, m.match_date
              FROM match m
              JOIN team t1 ON m.team1_id = t1.team_id
              JOIN team t2 ON m.team2_id = t2.team_id
              ORDER BY m.match_date DESC";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['team1']) . " vs " . htmlspecialchars($row['team2']) . "</td>";
            echo "<td>" . $row['match_date'] . "</td>";
            echo "<td><a href='match.php?id=" . $row['match_id'] . "' style='color:yellow;'>View Stats</a></td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='3'>No matches found</td></tr>";
    }
    ?>
    </tbody>
</table>
</div>

<!-- Admin Login Button (Floating) -->
<a href="login.php" class="admin-login">Admin Login</a>

</body>
</html>
