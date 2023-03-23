import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/pages/home_page.dart';
import 'package:soma_utility/providers/customer_provider.dart';
import 'package:soma_utility/providers/zone_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          Provider.value(value: AppDb()),
          ChangeNotifierProxyProvider<AppDb, ZoneProvider>(
            create: (context) => ZoneProvider(),
            update: (context, db, notifier) => notifier!..initAppDb(db)..getZonesFuture(),
          ),
          ChangeNotifierProxyProvider<AppDb, CustomerProvider>(
            create: (context) => CustomerProvider(),
            update: (context, db, notifier) => notifier!..initAppDb(db)..getCustomersFuture(),
          )
        ],
        child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
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
