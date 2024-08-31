 Task Overview:
We need to create a Dart function that checks if a given input (string or number) is a palindrome. A palindrome reads the same backward as forward, ignoring spaces, punctuation, and case differences. 

Let's break down the task into manageable steps:
Step 1: Clean the Input
Remove all non-alphanumeric characters (like spaces, punctuation).
Convert everything to lowercase to make the comparison case-insensitive.
Step 2: Check for Palindrome
Reverse the cleaned string and compare it to the original cleaned string.
Step 3: Handle Numeric Inputs
Convert numbers to strings and check them using the same logic.

bool isPalindrome(String input) {
  // Step 1: Clean the input string
  String cleanedInput = input
      .replaceAll(RegExp(r'[^A-Za-z0-9]'), '')  // Remove non-alphanumeric characters
      .toLowerCase();  // Convert to lowercase

  // Step 2: Reverse the cleaned string
  String reversedInput = cleanedInput.split('').reversed.join('');

  // Step 3: Check if cleaned string is equal to reversed string
  return cleanedInput == reversedInput;
}

bool isPalindromeNumber(int number) {
  // Convert the number to a string and check if it's a palindrome
  return isPalindrome(number.toString());
}

void main() {
  // Test cases
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("Racecar")); // true
  print(isPalindrome("Hello")); // false
  print(isPalindromeNumber(12321)); // true
  print(isPalindromeNumber(12345)); // false
}

Explanation:
isPalindrome(String input):
Cleans up the input by removing unwanted characters and making it lowercase.
Checks if the cleaned string matches its reverse.
isPalindromeNumber(int number):
Converts the number to a string and reuses the isPalindrome function for the check.
Testing:
The main() function includes test cases for both strings and numbers. When you run the code, it will print true or false based on whether the inputs are palindromes.


Sorting Algorithm Implementation Task
We'll implement two sorting algorithms: Quick Sort and Merge Sort. After that, we'll compare their performance.

1. Quick Sort Implementation
Quick Sort is a divide-and-conquer algorithm that works by selecting a 'pivot' element and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot.

List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;

  int pivot = list[list.length ~/ 2];
  List<int> less = [];
  List<int> greater = [];
  List<int> equal = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i] < pivot) {
      less.add(list[i]);
    } else if (list[i] > pivot) {
      greater.add(list[i]);
    } else {
      equal.add(list[i]);
    }
  }

  return quickSort(less) + equal + quickSort(greater);
}

2. Merge Sort Implementation
Merge Sort is another divide-and-conquer algorithm that splits the list into halves, recursively sorts each half, and then merges the sorted halves back together.

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;

  int mid = list.length ~/ 2;
  List<int> left = mergeSort(list.sublist(0, mid));
  List<int> right = mergeSort(list.sublist(mid));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));

  return result;
}

3. Performance Comparison
Let's compare the execution time of both algorithms using Dart's Stopwatch class.

void compareSortingAlgorithms(List<int> list) {
  Stopwatch stopwatch = Stopwatch();

  // Quick Sort
  stopwatch.start();
  List<int> quickSorted = quickSort(List.from(list));
  stopwatch.stop();
  print('Quick Sort took: ${stopwatch.elapsedMicroseconds} microseconds');

  // Reset stopwatch
  stopwatch.reset();

  // Merge Sort
  stopwatch.start();
  List<int> mergeSorted = mergeSort(List.from(list));
  stopwatch.stop();
  print('Merge Sort took: ${stopwatch.elapsedMicroseconds} microseconds');
}

void main() {
  List<int> unsortedList = [38, 27, 43, 3, 9, 82, 10];
  compareSortingAlgorithms(unsortedList);
}

Basic Calculator Function Task
Let's create a basic calculator function that can handle addition, subtraction, multiplication, division, and modulus operations.

1. Basic Arithmetic Calculator
   double basicCalculator(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) throw Exception("Division by zero is not allowed.");
      return num1 / num2;
    case '%':
      if (num2 == 0) throw Exception("Division by zero is not allowed.");
      return num1 % num2;
    default:
      throw Exception("Invalid operator.");
  }
}

2. Extended Multi-Step Operations
We can extend the calculator to handle a sequence of operations. For simplicity, we'll use a basic parser that assumes a left-to-right evaluation (no operator precedence).

double extendedCalculator(String expression) {
  List<String> tokens = expression.split(' ');
  double result = double.parse(tokens[0]);

  for (int i = 1; i < tokens.length; i += 2) {
    String operator = tokens[i];
    double nextNum = double.parse(tokens[i + 1]);
    result = basicCalculator(result, nextNum, operator);
  }

  return result;
}

void main() {
  // Test basic calculator
  print(basicCalculator(10, 5, '+'));  // Output: 15
  print(basicCalculator(10, 5, '-'));  // Output: 5
  print(basicCalculator(10, 5, '*'));  // Output: 50
  print(basicCalculator(10, 5, '/'));  // Output: 2
  print(basicCalculator(10, 5, '%'));  // Output: 0

  // Test extended calculator
  print(extendedCalculator("10 + 5 * 2 - 3 / 2"));  // Simplified left-to-right calculation
}

