import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int percent = 10;
  int points = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('랭킹'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$points points"),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: percent / 100,
                      barRadius: const Radius.circular(10),
                      progressColor: Colors.blue[400],
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
