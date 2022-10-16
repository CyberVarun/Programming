<?php
// echo is a function that prints a string to the screen
echo 'hello world';
echo '<br />';

// print is a function that prints a string to the screen
print 'hello world';
echo '<br />';

// printf is a function that prints a formatted string to the screen
printf('hello world');
echo '<br />';

// sprintf is a function that returns a formatted string
$string = sprintf('hello world');
echo '<br />';

// print_r is a function that prints a string representation of an array
print_r('hello world');
echo '<br />';

// var_dump is a function that prints a string representation of a variable
var_dump('hello world');
echo '<br />';

// var_export is a function that prints a string representation of a variable
var_export('hello world');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Printing Methods</title>
</head>

<body>
    <h1><?php echo 'Hello world!'; ?></h1>
    <h1><?= 'Hello world!'; ?></h1>
</body>

</html>