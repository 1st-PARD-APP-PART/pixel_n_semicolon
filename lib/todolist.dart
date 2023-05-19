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
       backgroundColor: const Color(0XFFFF7B31),
        elevation: 0.5,
        
      ),
      body: Column(
        children: [
          Container(
            decoration:  const BoxDecoration(color: Colors.black),
            height: 153,
            child:  Row(
              children: [

                const SizedBox(width: 16,),
              //  Image.asset('assets/Ellipse 4.png'),
               Image.asset('assets/Ellipse 1.png'),
                const SizedBox(width: 14,),
                 const Column(
                  children: [
                    SizedBox(height: 30,),
                  
                        Text('너는 정말 좋은 친구야 ', style: TextStyle(color: Colors.white, fontSize: 10, ),                        
                        ),
                       Text('김깔깔', style: TextStyle(color: Colors.white, fontSize: 20)),
                     SizedBox(height: 24,),
                     Text('10points', style: TextStyle(color: Colors.white, fontSize: 15),),
                     SizedBox(height: 8,),
                      //statusbar 만들기
                     // Image.asset('assets/rectangle 2.png'),
                  ],
                ),
              ],
            ),
          ),
         Container(
          decoration: const BoxDecoration(
            color: Color(0XFF340B76),
            
          ),
          height: 566,
          
         ),

          ]
          ),
          
         
      floatingActionButton: FloatingActionButton(
  onPressed: (){
    Navigator.pushNamed(context, '/add'); 
  },
  child: const Icon(Icons.add),
),
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
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
  ),
    );
  }
}
