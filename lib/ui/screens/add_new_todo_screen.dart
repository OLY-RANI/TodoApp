import 'package:flutter/material.dart';

import '../../entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});
  final Function(Todo) onAddTodo;


  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  TextEditingController _titleTextEditingController= TextEditingController();
  TextEditingController _descriptionTextEditingController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter the Title';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8,),
              TextFormField(

                controller: _descriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                maxLength: 200,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter the Title';
                  } else {
                    return null;
                  }
                },

              ),
              const SizedBox(height: 8,),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Todo todo = Todo(
                        _titleTextEditingController.text.trim(),
                        _descriptionTextEditingController.text.trim(),
                        DateTime.now());
                    widget.onAddTodo(todo);

                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
              const SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _descriptionTextEditingController.dispose();

    super.dispose();
  }
}


