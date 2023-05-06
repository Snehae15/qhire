import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qhire/const.dart';



class Services{


  static Future<dynamic> postWithIamge({
    required String endPoint,
    required Map params,
    required File image,
    required String imageParameter,
  }) async {
    var res;
    var request =
    MultipartRequest("POST", Uri.parse(Con.url + endPoint));
    params.entries.forEach((element) {
      request.fields[element.key] = element.value;
    });
    // request.fields['user'] = 'someone@somewhere.com';
    request.files.add(await MultipartFile.fromPath(
      imageParameter,
      image.path,
      // contentType: new MediaType('application', 'x-tar'),
    ));
    final response = await request.send();

    if (response.statusCode == 200) print("Uploaded!");
    final data = await Response.fromStream(response);
    print('image api response: ${data.body}');
    res = jsonDecode(data.body);

    return res;
  }

  static Future<File?> pickImage(BuildContext context) async {
    XFile? pickedFile;
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Select source'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.camera);
                Navigator.pop(context);
              },
              child: Text('camera'),
            ),
            ElevatedButton(
              onPressed: () async {
                pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Text('gallery'),
            ),
          ],
        ));

    print('>>>>>>>>>${pickedFile!.name}');

    if (pickedFile != null) {
      return File(pickedFile!.path);
    }
  }

}