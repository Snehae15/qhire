// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomeState();
// }
//
// class _HomeState extends State<Homepage> {
//   int currentindex=0;
//   final pages=[
//     // Home(),
//     // Homepage1(),
//     // Home(),
//     // ChatScreen(),
//     // Suggestion(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Q-Hire"),
//       //   centerTitle: true,
//       //   leading: GestureDetector(
//       //     onTap: () {
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(builder: (context) => Viewpro()),
//       //       );
//       //     },
//
//     body: pages[currentindex],
//             bottomNavigationBar: BottomNavigationBar(
//             currentIndex: currentindex,
//             onTap: (newIndex){
//             setState(() {
//             currentindex=newIndex;
//             });
//     },
//       items:[
//                   BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                     label: "Profile",
//                   ),
//                   BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//
//                   label: "Home",
//                   ),
//                   // BottomNavigationBarItem(
//                   // icon: Icon(Icons.add),
//                   //
//                   // label: "More",
//                   // ),
//                   BottomNavigationBarItem(
//                   icon: Icon(Icons.message),
//                   label: "Message",
//                   ),
//                   BottomNavigationBarItem(
//                   icon: Icon(Icons.shopping_bag),
//                   label: 'Jobs',
//                   ),
//                   ],
//                   // currentIndex: _selectedIndex,
//                   // onTap: _onItemTapped,
//        backgroundColor: Colors.blueGrey,
//        selectedItemColor: Colors.black,
//        unselectedItemColor: Colors.grey,
//     ),
//     );
//   }
// }