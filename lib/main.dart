import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/pages/home_page.dart';
import 'package:soma_utility/providers/zone_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
         // ChangeNotifierProxyProvider<ZoneProvider>(
         //   create: (context)=> ZoneProvider(),
         //   update: update)
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOMA UTILITY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
