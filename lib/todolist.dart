import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}



class _TodoListState extends State<TodoList> {
  String name='me';
  int selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 1) {
Navigator.pushNamed(context, '/ranking');    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
        elevation: 0.5,
        
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            height: 200,
            child: const Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.person, color: Colors.white,),
                SizedBox(width: 40,),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text('이름: ', style: TextStyle(color: Colors.white, fontSize: 20),                        
                        ),
                       // Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                      //statusbar 만들기
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),

          ]
          ),
          
         
      floatingActionButton: FloatingActionButton(
  onPressed: (){
    Navigator.pushNamed(context, '/add'); 
  },
  child: const Icon(Icons.add),
),
  bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            label: 'ranking',
          ),
        ],
  ),
    );
  }
}




