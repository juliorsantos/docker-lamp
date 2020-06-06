<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
<title>Welcome to Docker Lamp</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;500&display=swap" rel="stylesheet">
<style>
* { margin:0; padding: 0; }
body {
    width: 100%; height: 100vh;
    display: flex; align-items: center; justify-content: center; flex-direction: column;
    font-family: 'Roboto', sans-serif;
}
h1 { font-size: 5rem; font-weight: 500; padding: 6px 0; }
p { font-size: 1.5rem; font-weight: 100; padding: 6px 0; }
</style>
</head>
<body>

<h1>Docker Lamp</h1>
<p>Your stack is running.</p>

<?php
try {
    $pdo = new PDO("mysql:host=mysql; dbnameapp_db port=3306", "app_user", "app_password");
    echo "<pre>Your PDO connection looks ok.</pre>";
} catch(\Exception $e) {
    echo "<p>Error in MySQL connection:</p><br>";
    echo "<pre>{$e->getMessage()}</pre>";
}
?>

</body>
</html>