<?php
require __DIR__.'/../vendor/autoload.php';

use Tqdev\PhpCrudApi\Api;
use Tqdev\PhpCrudApi\Config;

$dbFile = __DIR__.'/../data/demo.sqlite';
if (!file_exists($dbFile)) {
    $pdo = new PDO('sqlite:' . $dbFile);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('CREATE TABLE customers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, city TEXT NOT NULL);');
    $pdo->exec("INSERT INTO customers (name, city) VALUES ('Acme Stores', 'Denver'), ('Northwind', 'Seattle'), ('Oceanic', 'Boston');");
}

$config = new Config([
    'driver' => 'sqlite',
    'address' => $dbFile,
]);

(new Api($config))->handle($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI'], $_SERVER['QUERY_STRING'], $_SERVER['HTTP_CONTENT_TYPE'] ?? '', file_get_contents('php://input'));
