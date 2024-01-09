import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_model_caching/second-variant/views/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const BasePage(),
    );
  }
}

List<Widget> pages = [
  const HomePage(),
  const AnotherPage(),
];

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int pageNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageNum],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageNum,
          onTap: (value) {
            print(value);
            pageNum = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.key), label: "key"),
            BottomNavigationBarItem(icon: Icon(Icons.wind_power), label: "wind power"),
          ]),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("this is text"),
    );
  }
}
