// import 'package:flutter/material.dart';
// import 'package:qhire/login.dart';
// import 'package:qhire/coursepage.dart';
//
// class Viewcourse extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Course'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(10.0),
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Coursepage()),
//               );
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 140.0,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'PHP',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Log()),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 140.0,
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Container 2',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Log()),
//               );
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 140.0,
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'PHP',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Log()),
//                       );
//                     },
//                     child: Container(
//                       height: 150.0,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Container 2',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }