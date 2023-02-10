import 'package:api_bloc/bloc/bloc/user_bloc.dart';
import 'package:api_bloc/model/user_model.dart';
import 'package:api_bloc/repos/repos.dart';
import 'package:api_bloc/screen/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => UserRepo(),
          child: const ScreenHome(),
        ));
  }
}
