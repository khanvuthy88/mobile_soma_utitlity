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
          body: FutureBuilder<List<CustomerModelData>>(
            future: Provider.of<AppDb>(context).getCustomerByZone(widget.zoneName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CustomerModelData>? customerList = snapshot.data;
                return ListView.builder(
                  itemCount: customerList?.length,
                  itemBuilder: (context, index) {
                    final customer = customerList![index];
                    return Card(
                      color: customer.newConsumption != 0 ? Colors.blue.shade200 : Colors.white,
                      child: ListTile(
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
                  },
                );
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
      );
  }
}

