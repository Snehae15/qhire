import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qhire/login.dart';
import 'package:qhire/loginstudent.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(child: Image.asset('assets/bg.png',),width: double.infinity,),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 125, width: 150, child: Image.asset('assets/img.png')),
              ],
            ),
             Text(
          'QHire',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child:Text(
  '- The best time for new beginnings is now -',
  style: GoogleFonts.aBeeZee(
    fontStyle: FontStyle.italic,
    fontSize: 12,
  ),
)

        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginStudent()),
                    );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 4, // Blur radius
                        offset: Offset(0, 3), // Offset in the (x, y) direction
                      ),
                    ],
                  ),
                  width: 130,
                  height: 40,
                  child: Center(child: Text('Student',style: TextStyle(fontWeight: FontWeight.w500),)),
                ),
              ),
              SizedBox(width: 15),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Log()),
                    );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 4, // Blur radius












                        offset: Offset(0, 3), // Offset in the (x, y) direction
                      ),
                    ],
                  ),
                  width: 130,
                  height: 40,
                  child: Center(child: Text('Employee',style: TextStyle(fontWeight: FontWeight.w500),)),
                ),
              )
            ],
          ),
        ),
       
      ],
    ),
        // Container(child: Image.asset('assets/bg.png',),width: double.infinity,),
          ],
        ),
       
       );
  }
}
