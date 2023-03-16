import 'package:flutter/material.dart';
import 'package:soma_utility/pages/synce_customer_page.dart';
import 'package:soma_utility/pages/synce_zone_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.blue,),
              title: const Text("Pull zone"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PullZonePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.blue),
              title: const Text("Pull Customer"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PullCustomerPage()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
