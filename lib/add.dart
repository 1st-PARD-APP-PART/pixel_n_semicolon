import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'util/authentication.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    pointsController.dispose();
    super.dispose();
  }

  void addData() {
    String title = titleController.text;
    String description = descriptionController.text;
    int points = int.parse(pointsController.text);

    Map<String, dynamic> data = {
      'title': title,
      'description': description,
      'points': points,
    };

    firestore.collection('data').add(data).then((_) {
      // Data added successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data added successfully!')),
      );
    }).catchError((error) {
      // Failed to add data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add data: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await Authentication().signOut();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('로그아웃 되었습니다'),
            ));
            Navigator.pushNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('1'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('2'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('3'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('4'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('5'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addData,
              child: const Text('Add ToDo'),
            ),
          ],
        ),
      ),
    );
  }
}
