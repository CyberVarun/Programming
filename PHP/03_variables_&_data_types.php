<?php
/* ----- Variables & Data Types ----- */

/* --------- PHP Data Types --------- */
/*
- String - A string is a series of characters surrounded by quotes
- Integer - Whole numbers
- Float - Decimal numbers
- Boolean - true or false
- Array - An array is a special variable, which can hold more than one value
- Object - A class
- NULL - Empty variable
- Resource - A special variable that holds a resource
*/

/* --------- Variable Rules --------- */
/*
- Variables must be prefixed with $
- Variables must start with a letter or the underscore character
- variables can't start with a number
- Variables can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ )
- Variables are case-sensitive ($name and $NAME are two different variables)
*/

/* --------- Variable Scope --------- */
/*
- Local - A variable declared within a function has a local scope and can only be accessed within that function
- Global - A variable declared outside a function has a global scope and can only be accessed outside a function
- Static - A static variable can only be accessed within a function, but it retains its value between function calls
*/  

$name = 'John Doe';
$age = 35;
$isMale = true;
$height = 1.85;
$salary = null;

echo $name . ' is ' . $age . ' years old.';
echo '<br />';

echo "$name is $age years old.";
echo '<br />';
echo '<br />';

$a = 5;
$b = 4;

echo "addition of $a and $b = $a + $b";
echo '<br />';
echo "subtraction of $a and $b = $a - $b";
echo '<br />';
echo "multiplicaton of $a and $b = $a * $b";
echo '<br />';
echo "division of $a and $b = $a / $b";
echo '<br />';
echo "$a % $b";
echo '<br />';
echo "$a ** $b";
echo '<br />';

// constants
define('PI', 3.14);
echo PI;
?>