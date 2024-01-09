import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_model_caching/second-variant/manager/user_cache_manager.dart';
import 'package:hive_model_caching/second-variant/model/user_model_second.dart';
import 'package:hive_model_caching/second-variant/service/user_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserModelSecond>? userList;
  final UserService _userService = UserService(Dio());
  late final ICacheManager<UserModelSecond> cacheManager;

  @override
  void initState() {
    super.initState();
    cacheManager = UserCacheManager('userCache');
    fetchData();
  }

  Future<void> fetchData() async {
    await cacheManager.init();
    if (cacheManager.getValues()?.isNotEmpty ?? false) {
      print("buraya girebilir");

      userList = cacheManager.getValues();
    } else {
      print("buraya girmemesi lazim");
      userList = await _userService.fetchData();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users"),
      ),
      body: (userList?.isNotEmpty ?? false)
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(userList![index].title.toString()),
                  ),
                );
              },
            )
          : const SizedBox.shrink(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // UserService(Dio()).fetchData();
          if (userList?.isNotEmpty ?? false) {
            await cacheManager.addItems(userList!);
          }
        },
      ),
    );
  }
}
