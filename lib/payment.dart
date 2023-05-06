import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:qhire/const.dart';
import 'package:qhire/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(PaymentPage());

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var dt = TextEditingController();

  TextEditingController dateinput = TextEditingController();
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');
    var data = {
      "id":sp,
      "dt":dt.text,
    };
    var response = await post(Uri.parse('${Con.url}payment.php'),body: data);
    print(response.body);
    if(response.statusCode==200){
      var res = jsonDecode(response.body)["message"];
      if(res=='Added'){
        const snackBar = SnackBar(
          content: Text('Successfully Registered'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Fluttertoast.showToast(msg:"successfully registered");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Log();
          },
        ));
      }

    }
    else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment Page'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Payment Amount - 200',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'UPI- #######7889',
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:"Date",
                  ), onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            dt.text = date.toString().split(' ')[0];
          }
        },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select the date';
            }
            // You can add more validation here if necessary, for example checking that the date is in the correct format or range.
            return null;
          },
        ),
      ),

              SizedBox(height: 16.0),
              ElevatedButton(onPressed: (){
                //Fluttertoast.showToast(msg: "Successfully registered");
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Log()));
              }, child: Text("PAY")),
            ],
          ),
        ),
      ),
    );
  }
}

