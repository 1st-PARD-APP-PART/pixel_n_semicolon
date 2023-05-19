import 'package:flutter/material.dart';

class GroupToMainScreen extends StatefulWidget {
  const GroupToMainScreen({super.key});

  @override
  State<GroupToMainScreen> createState() => _GroupToMainScreenState();
}

class _GroupToMainScreenState extends State<GroupToMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF444444),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'pixelNsemicolon',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(380, 60),
                  primary: Color(0XFFFF7E36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 테두리 둥글기 조정
                  ),
                ),
                child: const Text('토큰 복사')),
            SizedBox(
              height: 170,
            ),
            ElevatedButton(
                onPressed: () {
                  //main page(홈화면)로 이동
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 200),
                  primary: Color(0XFFFF7E36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 테두리 둥글기 조정
                  ),
                ),
                child: const Text('그룹 입장하기')),
          ],
        ),
      ),
    );
  }
}
