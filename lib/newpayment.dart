import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Paymentss extends StatefulWidget {
  const Paymentss({Key? key}) : super(key: key);

  @override
  State<Paymentss> createState() => _PaymentssState();
}

class _PaymentssState extends State<Paymentss> {
  Future<void> getData1() async {
    print('object');
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');

    print(sp);
    var data = {
      "id": sp,
    };
    var response = await post(Uri.parse('${Con.url}paymentfind.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body)['log_id'];
    print('>>>>>>>>>>>$res');
    var data1 ={
          "id":res,
        };
        print(sp);
        var response1 = await post(Uri.parse('${Con.url}payment.php'), body: data1);
        var res1 = jsonDecode(response1.body);
        print(response1.body);
        // if(response.statusCode==200){
        //   if(res['message']=='Added'){
            Fluttertoast.showToast(msg: "payment added");
        //     return "upi://pay?pa=name@oksbi&pn=admin&am=250.00&cu=INR";
        //   }
        // }else{
        //   Fluttertoast.showToast(msg: "something went wrong");
        // }
    // var response1 = await post(Uri.parse('${Con.url}payment.php'), body: data);
    // print(response.body);
    // var res1 = jsonDecode(response.body);
  }
  // Future<String?> getSave() async {
  //   print('object');
  //   var sp = 5;
  //   print(sp);
  //   var data ={
  //     "id":sp,
  //   };
  //   print(sp);
  //   var response = await post(Uri.parse('${Con.url}payment.php'), body: data);
  //   var res = jsonDecode(response.body);
  //   print(response.body);
  //   if(response.statusCode==200){
  //     if(res['message']=='Added'){
  //       Fluttertoast.showToast(msg: "payment added");
  //       return "upi://pay?pa=name@oksbi&pn=admin&am=250.00&cu=INR";
  //     }
  //   }else{
  //     Fluttertoast.showToast(msg: "something went wrong");
  //   }
  // return null;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Amount: 250'),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                getData1();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                height: 50,
                width: 300,
                child: const Center(
                  child: Text(
                    'Pay',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
