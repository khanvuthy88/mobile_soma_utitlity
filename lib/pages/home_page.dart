import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/pages/customer_by_zone_page.dart';
import 'package:soma_utility/pages/customer_page.dart';
import 'package:soma_utility/pages/synce_customer_page.dart';
import 'package:soma_utility/pages/synce_zone_page.dart';
import 'package:soma_utility/providers/zone_provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ZoneProvider>().zoneList;
    return ChangeNotifierProvider(
      create: (context) => ZoneProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("តំបន់ទាំងអស់"),
        ),
        drawer: homeDrawer(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
            ),
            itemBuilder: (context, index) {
              final zone = data[index];
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CustomerByZonePage(zoneId: zone.odooId, zoneName: zone.name)
                      )
                  );
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.addchart, color: Colors.white, size: 40),
                        const SizedBox(height: 10,),
                        Text(zone.name.toString(), style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ), textAlign: TextAlign.center),
                      ],
                    )
                ),
              );
            },
          ),
        )
      ),
    );
  }

  Drawer homeDrawer(BuildContext context) {
    return Drawer(
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
            leading: const Icon(Icons.list, color: Colors.blue),
            title: const Text('Customer List'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.download, color: Colors.blue,),
            title: const Text("ទាញយកតំបន់"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PullZonePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.download, color: Colors.blue),
            title: const Text("ទាញយកអតិថិជន"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PullCustomerPage()));
            },
          )
        ],
      ),
    );
  }
}
