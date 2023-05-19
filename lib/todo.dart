import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'model/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int _selectedIndex = 0;
  int percent = 80;
  int points = 2;
  late Timer _timer;
  late DateTime _midnight;
  late Duration _timeRemaining;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/ranking');
    }
  }

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
    super.dispose();
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

  Future<List<Todo>> _fetchTodosFromFirestore() async {
    final snapshot = await FirebaseFirestore.instance.collection('data').get();
    final todos = snapshot.docs.map((doc) {
      final data = doc.data();
      return Todo(
        title: data['title'],
        points: data['points'],
      );
    }).toList();
    return todos;
  }

  List<Card> _buildCards(BuildContext context, List<Todo> todos) {
    return todos.map((todo) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${todo.points}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final formattedDuration = _formatDuration(_timeRemaining);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7B31),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(width: size.width * 0.1),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'assets/user1.png',
                  scale: 0.6,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '너는 정말 좋은 친구야 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('김깔깔',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '57points',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LinearPercentIndicator(
                      width: 180,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 14.0,
                      percent: 0.7,
                      barRadius: const Radius.circular(19),
                      progressColor: const Color(0xFFFF7272),
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<Todo>>(
            future: _fetchTodosFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final todos = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return ListTile(
                        title: Text(todo.title),
                        subtitle: Text('Points: ${todo.points}'),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No items found.'),
                );
              }
            },
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'To-Do-list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.workspace_premium),
            label: 'ranking',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: const Color(0xFF4F4F4F),
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
