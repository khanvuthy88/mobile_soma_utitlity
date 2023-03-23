import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/providers/customer_provider.dart';

class CustomerByZonePage extends StatefulWidget {
  final int zoneId;
  final String zoneName;
  const CustomerByZonePage({Key? key, required this.zoneId, required this.zoneName}) : super(key: key);

  @override
  State<CustomerByZonePage> createState() => _CustomerByZonePageState();
}

class _CustomerByZonePageState extends State<CustomerByZonePage> {

  late List<CustomerModelData> customerList;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final zoneName = widget.zoneName;
    final data = context.watch<CustomerProvider>().customerList.where((element) => element.zone == widget.zoneName).toList();
    return ChangeNotifierProvider(
      create: (context) => CustomerProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("អតិថិជនតំបន់ $zoneName"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final customer = data[index];
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
        )
      ),
    );
  }
}

