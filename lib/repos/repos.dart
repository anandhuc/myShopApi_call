

import 'dart:convert';

import 'package:api_bloc/model/user_model.dart';
import 'package:http/http.dart';

class UserRepo{
  String url= 'https://mobi.maaxkart.com/call-back-products-by-loc';
  Future<List<Products>> getUsers() async{
    Response response =await get(Uri.parse(url));
    print(response.body.toString());
    print(response.statusCode.toString());
    if(response.statusCode==200){
      final List resutl= jsonDecode(response.body);
      print(resutl.toList());
      return resutl.map((e) => Products.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}