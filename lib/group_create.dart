import 'package:flutter/material.dart';

import 'group_code.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 192,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 85.12,
                height: 85.12,
                child: Image.asset('assets/images/Group 2.png'),
              ),
              SizedBox(
                width: 11.8,
              ),
              Column(
                children: [
                  Text(
                    '환영한다!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '김깔깔!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 97,
          ),
          Container(
            width: 265,
            height: 27,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: '그룹 이름을 작성해주세요.',
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GroupCodeScreen()));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(156, 35),
              primary: Color(0XFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // 테두리 둥글기 조정
              ),
            ),
            child: const Text(
              '확인',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(156, 35),
              primary: Color(0XFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // 테두리 둥글기 조정
              ),
            ),
            child: const Text(
              'back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
