import 'dart:io';
import 'package:console_project/services/task_manager.dart';
import 'package:riverpod/riverpod.dart';


final container = ProviderContainer();

void main() {
  print("Welcome to the To-Do List System!");
  while (true) {
    printMenu();
    String? input = stdin.readLineSync();
    handleUserInput(input);
  }
}

void printMenu() {
  print("\nMenu:");
  print("1. Add Task");
  print("2. View Tasks");
  print("3. Mark Task as Complete");
  print("4. Delete Task");
  print("5. Exit");
  print("Enter your choice: ");
}

void handleUserInput(String? input) {
  switch (input) {
    case '1':
      addTask();
      break;
    case '2':
      viewTasks();
      break;
    case '3':
      markTaskAsComplete();
      break;
    case '4':
      deleteTask();
      break;
    case '5':
      exit(0);
    default:
      print("Invalid option! Please choose a valid menu item.");
  }
}

void addTask() {
  print("Enter task description: ");
  String? description = stdin.readLineSync();
  if (description != null && description.isNotEmpty) {
    container.read(taskManagerProvider.notifier).addTask(description);
    print("Task added.");
  } else {
    print("Description cannot be empty.");
  }
}

void viewTasks() {
  container.read(taskManagerProvider.notifier).viewTasks();
}

void markTaskAsComplete() {
  print("Enter the index of the task to mark as complete: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');
  if (index != null) {
    container.read(taskManagerProvider.notifier).markTaskAsComplete(index);
    print("Task marked as complete.");
  } else {
    print("Invalid index.");
  }
}

void deleteTask() {
  print("Enter the index of the task to delete: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');
  if (index != null) {
    container.read(taskManagerProvider.notifier).deleteTask(index);
    print("Task deleted.");
  } else {
    print("Invalid index.");
  }
}