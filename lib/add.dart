import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late Timer _timer;
  late DateTime _midnight;
  late Duration _timeRemaining;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _midnight = _calculateMidnight();
    _timeRemaining = _calculateTimeRemaining();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeRemaining = _calculateTimeRemaining();
        if (_timeRemaining.inSeconds <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
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

  DateTime _calculateMidnight() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    return midnight;
  }

  Duration _calculateTimeRemaining() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    return midnight.difference(now);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final formattedDuration = _formatDuration(_timeRemaining);

    return Scaffold(
      backgroundColor: const Color(0xFF340B76),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7B31),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.asset('assets/timer.png'),
            Text(
              formattedDuration,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF340B76),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: const Color(0xFFD9D9D9),
                    ),
                    child: const Text(
                      '<',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Text(
                    'To-do list',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('확인'),
                  )
                ],
              ),
              const Divider(
                height: 10,
                thickness: 2,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.black,
                        labelText: '너희 할일을 적어죠!',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '얼마나 어렵니.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    const Text(
                      '어려울수록 너는 포인트를 get.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              width: 58,
                              child: Flexible(
                                child: Text(
                                  '누워서 \n숨쉬기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  padding: const EdgeInsets.all(20)),
                              child: const Text('1'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 58,
                              child: Flexible(
                                child: Text(
                                  '누워서 \n숨쉬기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  padding: const EdgeInsets.all(20)),
                              child: const Text('1'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 58,
                              child: Flexible(
                                child: Text(
                                  '누워서 \n숨쉬기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  padding: const EdgeInsets.all(20)),
                              child: const Text('1'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 58,
                              child: Flexible(
                                child: Text(
                                  '누워서 \n숨쉬기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  padding: const EdgeInsets.all(20)),
                              child: const Text('1'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
