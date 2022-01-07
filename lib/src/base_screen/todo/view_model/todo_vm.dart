import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/services/firebase/collections.dart';
import 'package:todo/src/base_screen/todo/model/tasks.dart';
import 'package:todo/utils/helper.dart';

class TodoVM extends ChangeNotifier {
  Task? removedTask;

  TodoVM() {
    loadData();
  }

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    //we are creating getter as we set the main tasks to private.
    // we did so , so that we remember that we can just add items
    // to it using provider. we need to use the addTask method which
    // we created.
    return UnmodifiableListView(_tasks); //also the above is unmodifieable
  }

  int get tasksCount {
    return _tasks.length;
  }

  Future<void> addTask(String newTaskTitle) async {
    try {
      final _task = Task(name: newTaskTitle, isDone: false);
      DocumentReference documentReference = FBCollections.todos.doc();
      await documentReference.set(_task.toMap());
      _task.docRef = documentReference;
      _tasks.add(_task);
      Helper.showSnackBar("Addded the task Succesfully!");
    } catch (e) {
      log(e.toString());
    }
  }

  void updateTask(Task task) {
    task.docRef!.update(task.toMap());
  }

  Future<void> deleteTask(Task task) async {
    try {
      await task.docRef!.delete();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loadData() async {
    var query = await FBCollections.todos.get();
    if (query.docs.isNotEmpty) {
      _tasks = query.docs
          .map((e) => Task.fromMap(e.data() as Map, e.reference))
          .toList();
    }
  }

  Future<void> deleteAll() async {
    try {
      await Future.wait(List.generate(
          _tasks.length, (index) => _tasks[index].docRef!.delete()));
      Helper.showSnackBar("All task Deleted Succesfully ");
    } catch (e) {
      print(e.toString());
    }
  }

  void checkAll() {
    for (var i = 0; i < _tasks.length; i++) {
      _tasks[i].isDone = true;
    }
    notifyListeners();
  }

  void uncheckAll() {
    for (var i = 0; i < _tasks.length; i++) {
      _tasks[i].isDone = false;
    }
    notifyListeners();
  }
}
