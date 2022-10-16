<?php
/* ----------- Arrrays ----------- */

/*
  Arrays hold multiple values. Each value in an array is called an "element"
*/

// Create an array
$fruits = array('Apple', 'Banana', 'Orange');

// Print the whole array
echo '<pre>';
var_dump($fruits);

// Get element by index
echo $fruits[1] . ' '; // Banana

// Set element by index
$fruits[0] = 'Peach';
echo $fruits[0] . ' '; // Peach

// Check if array has element at index 2
isset($fruits[2]); // true

// Append element
$fruits[] = 'Banana';
echo $fruits[3] . ' '; // Banana

// Print the length of the array
echo count($fruits) . ' '; // 4

// Add element at the end of the array
array_push($fruits, 'Fruit4');
echo $fruits[4] . ' '; // Fruit4

// Remove element from the end of the array
echo array_pop($fruits) . ' '; // Fruit4

// Add element at the beginning of the array
array_unshift($fruits, 'Fruit1');
echo $fruits[0] . ' '; // Fruit1

// Remove element from the beginning of the array
echo array_shift($fruits) . ' '; // Fruit1

// Split the string into an array
$string = "Apple, Banana, Peach";
echo explode(", ", $string)[1] . ' '; // Banana

// Combine array elements into string
echo implode(" - ", $fruits); // Apple - Banana - Peach

// Check if element exist in the array
in_array('Apple', $fruits); // true
in_array('Potato', $fruits); // false

// Search element index in the array
array_search('Banana', $fruits); // 1


// Merge two arrays
$vegetables = ['Potato', 'Cucumber'];
echo '<pre>';
var_dump(array_merge($fruits, $vegetables)); // ["Apple", "Banana", "Peach", "Potato", "Cucumber"]

// Sorting of array (Reverse order also)
sort($fruits); // Sort arrays in ascending order
print_r($fruits); // Array ( [0] => Apple [1] => Banana [2] => Peach )

rsort($fruits); // Sort arrays in descending order
print_r($fruits); // Array ( [0] => Peach [1] => Banana [2] => Apple )

// Associative arrays (Key & Value pairs)
$person = [
  'name' => 'Brad',
  'surname' => 'Traversy',
  'age' => 30,
  'hobbies' => ['Tennis', 'Video Games']
];

// Get element by key
echo $person['name'] . ' '; // Brad

// Set element by key
$person['channel'] = 'Traversy Media';

// Null coalescing assignment operator. Since PHP 7.4
if (!isset($person['address'])) {
  $person['address'] = 'unknown';
}

$person['address'] ??= 'unknown';

echo $person['address'] . ' '; // unknown

// Print the keys of the array
echo '<pre>';
var_dump(array_keys($person)); // ["name", "surname", "age", "hobbies", "channel", "address"]

// Print the values of the array
echo '<pre>';
var_dump(array_values($person)); // ["Brad", "Traversy", 30, ["Tennis", "Video Games"], "Traversy Media", "unknown"]

// Sorting associative arrays by values, by keys
ksort($person); // Sort associative arrays in ascending order, according to the key
krsort($person); // Sort associative arrays in descending order, according to the key
asort($person); // Sort associative arrays in ascending order, according to the value
arsort($person); // Sort associative arrays in descending order, according to the value

// Two dimensional arrays
$todos = [
  ['title' => 'Todo title 1', 'completed' => true],
  ['title' => 'Todo title 2', 'completed' => false]
];

echo '<pre>';
var_dump($todos[1]['title']); // Todo title 2
?>