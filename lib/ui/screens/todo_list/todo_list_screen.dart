import 'package:flutter/material.dart';
import 'package:todo/ui/screens/add_new_todo_screen.dart';
import 'package:todo/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo/ui/screens/todo_list/undone_todo_list_tab.dart';
import 'package:todo/ui/widgets/todo_item.dart';

import '../../../entities/todo.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>
    with SingleTickerProviderStateMixin {
  final List<Todo> _todoList = [];

/*  late TabController _tabController;*/

/*
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          /*  controller: _tabController,*/
          children: [
            AllTodoListTab(
              onDelete:
                _deleteTodo,
              onStatusChange:
                _toggleTodoStatus,
              todoList: _todoList,
            ),
            UndoneTodoListTab(onDelete:
            _deleteTodo,
              onStatusChange:
              _toggleTodoStatus,
              todoList: _todoList.where((item) => item.isDone == false).toList(),),
            DoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == true).toList(),
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
            ),
          ],
        ),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: 'Add New Todo',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(
                      onAddTodo: _addNewTodo,
                    )));
      },
      label: Text('Add'),
      icon: Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
        /*  controller: _tabController,*/
        tabs: [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Undone',
          ),
          Tab(
            text: 'Done',
          ),
        ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
