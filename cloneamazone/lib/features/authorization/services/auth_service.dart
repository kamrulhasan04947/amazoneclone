import 'package:cloneamazone/commonwidgits/widgits/utils.dart';
import 'package:cloneamazone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handling.dart';
import '../../../constants/globalVaribles.dart';

class AuthService{


  // SignUpService

  void signupUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  })async{
     try{
       User user = User(id: "", name: name, password: password, address: "", usertype: "", token: "", email: email);
       http.Response res = await http.post(
           Uri.parse('$uri/admin/signup'),
           body: user.toJson(),
           headers: <String, String>{
             'Content-Type': 'application/json; charset=UTF-8',
           },
       );
       if (!context.mounted) return;
       httpErrorHandle(
           response: res,
           context: context,
           onSuccess: (){
             showSnakeBar(context, 'Account Created Successfully');
           },
       );
      }catch(e){
       showSnakeBar(context, e.toString());
     }
  }
}