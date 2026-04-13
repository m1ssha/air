<?php
$user = $_GET['username'] ?? '';
$pass = $_GET['password'] ?? '';
?>
<!doctype html>
<html>
<head><meta charset="utf-8"><title>Buggy</title></head>
<body>
  <h1>Buggy Webapp</h1>
  <form method="get">
    <input type="text" name="username" placeholder="username" value="<?= htmlspecialchars($user) ?>">
    <input type="password" name="password" placeholder="password" value="<?= htmlspecialchars($pass) ?>">
    <button type="submit">Login</button>
  </form>
</body>
</html>