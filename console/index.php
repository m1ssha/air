<?php
require_once __DIR__ . '/vendor/autoload.php';

$client = new MongoDB\Client("mongodb://mongo:27017");
$collection = $client->AirSIEM->alerts;
$cursor = $collection->find([], ['sort' => ['_id' => -1]]);
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>AirSIEM Dashboard</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 30px; }
    table { border-collapse: collapse; width: 100%; }
    td, th { border: 1px solid #ccc; padding: 8px; }
    th { background: #eee; }
  </style>
</head>
<body>
  <h1>AirSIEM Dashboard</h1>
  <table>
    <tr>
      <th>ID</th>
      <th>Timestamp</th>
      <th>SID</th>
      <th>Level</th>
      <th>Source</th>
      <th>Message</th>
    </tr>
    <?php foreach ($cursor as $doc): ?>
      <tr>
        <td><?= htmlspecialchars((string)$doc['_id']) ?></td>
        <td><?= htmlspecialchars($doc['timestamp'] ?? '') ?></td>
        <td><?= htmlspecialchars($doc['rule_sid'] ?? '') ?></td>
        <td><?= htmlspecialchars($doc['level'] ?? '') ?></td>
        <td><?= htmlspecialchars($doc['source'] ?? '') ?></td>
        <td><?= htmlspecialchars($doc['message'] ?? '') ?></td>
      </tr>
    <?php endforeach; ?>
  </table>
</body>
</html>