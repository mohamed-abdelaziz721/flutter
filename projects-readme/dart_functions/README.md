# Sprints-NAID-Flutter 



 This repository show my implementations of  flutter projects with Sprints and NAID.

<p align="center">
  <img src="images/naid.png" width="100" />
  <img src="images/android-studio-logo.png" width="200", height="100" />   
  <img src="images/sprints.png" width="100" />   
</p>
 


## Projects List

|  # |                                       Project Name                                       |          Status          |
|:--:|:----------------------------------------------------------------------------------------:|:------------------------:|
| 01 | [Dart Functions](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/dart_functions) |    :heavy_check_mark:    |
| 02 |          [Signin Form](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/signin_form)          |    :heavy_check_mark:    |
| 03 |          [Layout Exercise](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/layout_exercise)              |    :heavy_check_mark:   
| 04 |          [Page Navigation](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/page_navigation)              |   :heavy_check_mark:     |
| 05 |          [Http Request](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/http_request)              |   :heavy_check_mark:     |
| 06 |          [Release Settings](https://github.com/mohamed-abdelaziz721/flutter/tree/master/projects-readme/release_settings)              |   :heavy_check_mark:     |

# 01 - Dart Functions
> 1. Program take 2 numbers and return the sum of the numbers.
```dart
void main() {
  int num1 = 4;
  int num2 = 5;

  int result = add(num1, num2);

  print("Output: $result");
}

int add(int num1, int num2) {
  return num1 + num2;
}
```
```dart
# Using Arrow Function 
int add(int x, int y) => x + y;

void main() {
  print(add(3, 5));
}
```

> 2. Program take 3 numbers and return the biggest.
```dart
void main() {
  
int largest;  
int num1 = 10;
int num2 = 14;
int num3 = 50;

if ((num1 >= num2) & (num1 >= num3)){
  largest = num1;
} else if((num2 >= num1) & (num2 >= num3)){
  largest = num2;
} else{
  largest = num3;
}
print('The largest number is $largest');
}
```

## Edited Problem 2 (The largest of Three Numbers)
### Reason to Edit
> To find the greatest we need to look at exactly 3 intgers. using nested if looks at 6 intgers with 3 comparisons. The method below looks at 3 integers with only 2 comparisons.

```dart
import 'dart:math';

void main() {
  
int num1 = 10;
int num2 = 14;
int num3 = 50;

int largest = max(num1, num2);
largest = max(largest, num3);
  
print('The largest number is $largest');
}
```



> 3. Program take a word and return number of repeated characters
```dart
void main(List<String> args) {
  var input = 'Summer_Android_Intern_Sprints_NAID'.toLowerCase().split('');
  var list1 = input.toSet();
  var myMap = Map<String, int>.fromIterables(list1, List.generate(list1.length, (i) => 0));
  input.forEach((e) => myMap[e] = myMap[e]! + 1);
  print(myMap);
}
```
> 4. Write a code that loop on list and print what inside it using for each
```dart
void main() {
  var words = ['Sprints', 'NAID', 'Android', 'Flutter', 'Dart'];
  
  words.forEach((String word) {
    print('$word has ${word.length} characters');
  });
}

```

> 5. Write a program that loop on list and print what inside it using for in
```dart
void main() { 
   var words = ['Sprints', 'NAID', 'Android', 'Flutter', 'Dart'];
   
   for (var word in words) { 
      print(word); 
   } 
} 
```

> 6. Create a function that takes income and return a number of that tax and make the tax argument is optional and give it a default value = 1500

```dart
void main() {
 
  incomeTaxCalculator(10000);
}

void incomeTaxCalculator(double income, [double tax = 1500]) {
  
  
  double totalTax;
  if (income <= 20000){
    print("$income tax is  $tax");
  } else if((income > 20000) & (income < 40000)){
    totalTax = income*.2;
    print("$income tax is  $totalTax");
  } else{
    totalTax = income*.25;
    print("$income tax is  $totalTax");
  }
  
}
```






## About the Projects

This Project is part of the NAID Mobile App Internship hosted and managed by Sprints concerning Flutter. 

## Tools 
- Android Studio
- Flutter 
- Dart

## Prerequisites
A good Understanding of `Java`, `OOP`, `Dart`  and one of its GUI Components (Android Studio)\
However, you can apply the concepts of the projects with any other preferred programming language.








## Supervision
> Eng. Omar Sherif - Sprints - NAID



