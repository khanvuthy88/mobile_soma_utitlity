import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/pages/customer_page.dart';
import 'package:soma_utility/providers/customer_provider.dart';

import '../constants.dart';
import 'home_page.dart';
class PullCustomerPage extends StatefulWidget {
  const PullCustomerPage({Key? key}) : super(key: key);

  @override
  State<PullCustomerPage> createState() => _PullCustomerPageState();
}

class _PullCustomerPageState extends State<PullCustomerPage> {
  bool isLoading = false;

  void fetchCustomer() async {
    try{
      await odooHost.authenticate(odooDatabase, odooUsername, odooPassword);
      await Provider.of<CustomerProvider>(context, listen: false).emptyCustomer();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('ចាប់ផ្តើមទាញយកអតិថិជន'),
        backgroundColor: Colors.green.shade300,
      ));
      final data = await odooHost.callKw({
        'model': 'water.usage.consumption',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {},
          'domain': [
            ['customer_station', '!=', false],
            ['zone', '!=', false],
            ['village', '!=', false],
            ['company_id', '=', 21],
            ['customer_khmer_name', '!=', false],
            ['state', '=', 'draft']
          ],
          'fields': [
            'id',
            'location_code',
            'previous_index',
            'water_code',
            'entry_consumption',
            'usage_consumption',
            'customer_station',
            'zone',
            'village',
            'customer_khmer_name'
          ],
        },
      });
      final List<CustomerModelCompanion> customerData = [];

      for(var customer in data){
        final entity = CustomerModelCompanion(
            name: drift.Value(customer['customer_khmer_name']),
            odooID: drift.Value(customer['id'].toInt()),
            station: drift.Value(customer['customer_station'][1]),
            village: drift.Value(customer['village']),
            zone: drift.Value(customer['zone']),
            previousConsumption: drift.Value(
                customer['previous_index'].toInt()),
            meter: drift.Value(customer['water_code'][1]),
            newConsumption: const drift.Value(0),
            usageConsumption: const drift.Value(0),
            locationCode: drift.Value(customer['location_code']),
            odooZoneId: drift.Value(customer['customer_station'][0].toInt())
        );
        customerData.add(entity);
      }

      await Provider.of<AppDb>(context, listen: false).customerBatchInsert(customerData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      setState(() {
        isLoading=false;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CustomerPage()));

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));

    } on OdooException catch (e) {
      setState(() {
        isLoading = false;
      });
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
            fetchCustomer();
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
                Text("ទាញយកអតិថិជន",
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
