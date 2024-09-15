import 'package:console_project/models/product.dart';
import 'package:riverpod/riverpod.dart';


final taskManagerProvider = StateNotifierProvider<TaskManager, List<Task>>((ref) {
  return TaskManager();
});

class TaskManager extends StateNotifier<List<Task>> {
  TaskManager() : super([]);

  void addTask(String description) {
    state = [...state, Task(description)];
  }

  void markTaskAsComplete(int index) {
    if (index >= 0 && index < state.length) {
      state[index].markAsComplete();
      state = [...state];  // To update the state
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < state.length) {
      state = [...state..removeAt(index)];
    }
  }

  void viewTasks() {
    if (state.isEmpty) {
      print("No tasks available.");
    } else {
      for (int i = 0; i < state.length; i++) {
        print('$i: ${state[i]}');
      }
    }
  }
}