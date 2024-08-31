//Quick Sort Implementation
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

//Merge Sort Implementation
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


// Performance Comparison
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


//Basic Arithmetic Calculator
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

//Extended Multi-Step Operations
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

