import 'package:flutter/material.dart';

class addToDo extends StatefulWidget {
  const addToDo({super.key});

  @override
  State<addToDo> createState() => _addToDoState();
}

class _addToDoState extends State<addToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: const Text('Add Data'),
      ),
      
    );
  }
}