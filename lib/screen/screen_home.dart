import 'package:api_bloc/bloc/bloc/user_bloc.dart';
import 'package:api_bloc/model/user_model.dart';
import 'package:api_bloc/repos/repos.dart';
import 'package:api_bloc/screen/screendetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final imageBaseUrl = "https://admin.maaxkart.com/";
    return BlocProvider(
      create: (context) => UserBloc(RepositoryProvider.of<UserRepo>(context))
        ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("myShop"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<Products> proList = state.users;
              return ListView.builder(
                itemCount: proList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      onTap: () {
                       Get.to(ScreenDetails(e: proList,index: index,)); 
                      },
                      shape: RoundedRectangleBorder(
                      
                        side: BorderSide(width: 1, color: Colors.black45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Color.fromARGB(255, 218, 218, 218),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                          imageBaseUrl + proList[index].image.toString(),
                        ),
                      ),
                      title: Text(
                        proList[index].proName.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(proList[index].companyName.toString()),
                      trailing: Text('₹ ' + proList[index].price.toString()),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("ERROR"),
              );
            }
          },
        ),
      ),
    );
  }
}
