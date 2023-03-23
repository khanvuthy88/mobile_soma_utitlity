import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:soma_utility/pages/home_page.dart';
import 'package:soma_utility/providers/zone_provider.dart';

import '../constants.dart';
import '../db/app_db.dart';

class PullZonePage extends StatefulWidget {
  const PullZonePage({Key? key}) : super(key: key);

  @override
  State<PullZonePage> createState() => _PullZonePageState();
}

class _PullZonePageState extends State<PullZonePage> {
  bool isLoading = false;

  void fetchZone() async {
    try{
      await odooHost.authenticate(odooDatabase, odooUsername, odooPassword);
      setState(() {
        isLoading=true;
      });
      await Provider.of<ZoneProvider>(context, listen: false).emptyZones();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('ចាប់ផ្តើមទាញយកតំបន់'),
        backgroundColor: Colors.green.shade300,
      ));
      final List data = await odooHost.callKw({
        'model': 'res.partner.zone',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {},
          'domain': [['company_id', '=', 21]],
          'fields': ['id', 'name'],
          'limit': 80,
        },
      });
      final List<ZoneModelCompanion> zoneData = [];
      for(var dd in data){
        final zone = ZoneModelCompanion(
            name: drift.Value(dd['name']),
            odooId: drift.Value(dd['id'])
        );
        zoneData.add(zone);
      }

      await Provider.of<AppDb>(context, listen: false).zoneBatchInsert(zoneData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      setState(() {
        isLoading=false;
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));

    } on OdooException catch (e) {
      debugPrint(e.toString());
      // odooHost.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : InkWell(
          onTap: (){
            setState(() {
              isLoading = true;
            });
            fetchZone();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.download, color: Colors.white),
                const SizedBox(width: 10),
                Text("ទាញយកតំបន់",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
