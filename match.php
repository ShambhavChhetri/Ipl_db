<?php
include 'db_connect.php';

if (!isset($_GET['id'])) {
    die("No match selected.");
}
$match_id = $_GET['id'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Match Stats</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1>🏏 Match Scorecard</h1>

<nav>
    <a href="index.php">Home</a>
</nav>

<?php
// Fetch match details
$query = "SELECT t1.team_name AS team1, t2.team_name AS team2, m.match_date
          FROM match m
          JOIN team t1 ON m.team1_id = t1.team_id
          JOIN team t2 ON m.team2_id = t2.team_id
          WHERE m.match_id = $match_id";

$result = mysqli_query($conn, $query);
$match = mysqli_fetch_assoc($result);

echo "<h2>" . htmlspecialchars($match['team1']) . " vs " . htmlspecialchars($match['team2']) . " (" . $match['match_date'] . ")</h2>";

// Fetch scores
$query = "SELECT t.team_name, s.runs, s.wickets, s.overs
          FROM score s
          JOIN team t ON s.team_id = t.team_id
          WHERE s.match_id = $match_id";

$result = mysqli_query($conn, $query);

echo "<div class='table-container'>";
echo "<table>";
echo "<thead><tr><th>Team</th><th>Runs</th><th>Wickets</th><th>Overs</th></tr></thead>";
echo "<tbody>";
while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($row['team_name']) . "</td>";
    echo "<td>" . $row['runs'] . "</td>";
    echo "<td>" . $row['wickets'] . "</td>";
    echo "<td>" . $row['overs'] . "</td>";
    echo "</tr>";
}
echo "</tbody></table></div>";
?>

</body>
</html>
