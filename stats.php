<?php
include 'db_connect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Top Stats</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1>Player Stats</h1>

<nav>
    <a href="index.php">Home</a>
</nav>

<h2>Top Run Scorers</h2>
<div class="table-container">
<table>
    <thead>
        <tr>
            <th>Player</th>
            <th>Team</th>
            <th>Runs</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $query = "SELECT p.player_name, t.team_name, p.runs_scored AS total_runs
    FROM player p
    JOIN team t ON p.team_id = t.team_id
    ORDER BY total_runs DESC
    LIMIT 6";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['player_name']) . "</td>";
            echo "<td>" . htmlspecialchars($row['team_name']) . "</td>";
            echo "<td>" . $row['total_runs'] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='3'>No stats available</td></tr>";
    }
    ?>
    </tbody>
</table>
</div>

<h2>Top Wicket Takers</h2>
<div class="table-container">
<table>
    <thead>
        <tr>
            <th>Player</th>
            <th>Team</th>
            <th>Wickets</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $query = "SELECT p.player_name, t.team_name, p.wickets_taken AS total_wickets
    FROM player p
    JOIN team t ON p.team_id = t.team_id
    ORDER BY total_wickets DESC
    LIMIT 6";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['player_name']) . "</td>";
            echo "<td>" . htmlspecialchars($row['team_name']) . "</td>";
            echo "<td>" . $row['total_wickets'] . "</td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='3'>No stats available</td></tr>";
    }
    ?>
    </tbody>
</table>
</div>

</body>
</html>
