import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top:25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Joe Doe",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Serif"
                    ),),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.location_on_outlined,color: Colors.black,size: 30,),
                    SizedBox(width: 10,),
                    Text(
                      "Address: 43 Oxford Road M13\n4GR Manchester, UK",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // To add rounded image
          const Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 56,
              width: 56,
              child:  CircleAvatar(
                backgroundImage: AssetImage("assets/drop.png",),
              ),
            ),
          )
        ],
      ),
    );
  }
}