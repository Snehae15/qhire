import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qhire/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Future<String?> getSave() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('log_id');

    var data = {
      "id": sp,
    };
    print(data);
print(sp);
    var response = await post(Uri.parse('${Con.url}payment.php'), body: data);
    var res = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      if (res['message'] == 'Added') {
        Fluttertoast.showToast(msg:"payment added");
        // Navigator.push(context,MaterialPageRoute(builder:(context){
        //   return Stdhome();
        // }));
        return "upi ://pay?pa=name@oksbi&pn=admin&am=250.00&cu=INR";
      }
    } else {
      Fluttertoast.showToast(msg: "something went wrong");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          "Payments",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
          future: getSave(),
          builder: (context, AsyncSnapshot<String?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(snapshot.data!)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('price: 250 Rs'),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PrettyQr(
                        size: 200,
                        data: snapshot.data!,
                        errorCorrectLevel: QrErrorCorrectLevel.M,
                        roundEdges: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ElevatedButton(
                        onPressed: () {
                          getSave();
                        },
                        child: const Text("Pay"),),
                  ),
                ]),
              );
            }
          }),
    );
  }
}
