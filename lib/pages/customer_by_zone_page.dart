import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/models/customer_model.dart';
import 'package:soma_utility/pages/customer_by_zone_done_read_page.dart';
import 'package:soma_utility/providers/customer_provider.dart';

class CustomerByZonePage extends StatefulWidget {
  final int zoneId;
  final String zoneName;
  const CustomerByZonePage({Key? key, required this.zoneId, required this.zoneName}) : super(key: key);

  @override
  State<CustomerByZonePage> createState() => _CustomerByZonePageState();
}

class _CustomerByZonePageState extends State<CustomerByZonePage> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("អតិថិជនតំបន់ ${widget.zoneName}"),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => CustomerByZoneDoneReadPage(zoneName: widget.zoneName))));
              }, icon: const Icon(Icons.checklist))
            ],
          ),
          body: _buildCustomerList(context, widget.zoneName)
      );
  }
}

StreamBuilder<List<CustomerModelData>> _buildCustomerList(BuildContext context, String zoneNme){
  final db = Provider.of<AppDb>(context);
  return StreamBuilder(
    stream: db.getCustomerSteamByZone(zoneNme),
    builder: (context, snapshot) {
      final customerList = snapshot.data ?? [];
      return ListView.builder(
        itemCount: customerList.length,
        itemBuilder: ((context, index) {
          final customer = customerList[index];
          return _buildListItem(customer, db);
        })
      );
    },
  );
}

Widget _buildListItem(CustomerModelData customer, AppDb db){
  return Card(
    color: customer.newConsumption != 0 ? Colors.blue.shade200 : Colors.white,
    child: ListTile(
      onTap: (){
        debugPrint("Clicked ${customer.name}");
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customer.name),
          Text(customer.meter.toString()),
        ],
      ),
      title: Text(customer.village),
      subtitle: Text(customer.zone),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('អំណានថ្មី: ${customer.newConsumption}'),
          Text('អំណានចាស់: ${customer.previousConsumption}'),
        ],
      ),
    ),
  );
}