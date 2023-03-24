import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/pages/customer_by_zone_done_read_page.dart';

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
          return _buildListItem(customer, db, context);
        })
      );
    },
  );
}

Widget _buildListItem(CustomerModelData customer, AppDb db, BuildContext context){
  final TextEditingController _entryConsumptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void updateCustomer(int id) async {
    final customer = await Provider.of<AppDb>(context, listen: false).getCustomer(id);
    final int? previousConsumption = customer.previousConsumption;
    final int entryConsumption = int.parse(_entryConsumptionController.text);
    final int totalUsageConsumption = entryConsumption- previousConsumption!;
    final entity = CustomerModelCompanion(
      id: drift.Value(customer.id),
      name: drift.Value(customer.name),
      station: drift.Value(customer.station),
      village: drift.Value(customer.village),
      zone: drift.Value(customer.zone),
      meter: drift.Value(customer.meter),
      previousConsumption: drift.Value(customer.previousConsumption),
      newConsumption: drift.Value(int.parse(_entryConsumptionController.text)),
      usageConsumption: drift.Value(totalUsageConsumption),
      odooZoneId: drift.Value(customer.odooZoneId),
    );
    await Provider.of<AppDb>(context, listen: false).updateCustomer(entity);
    Navigator.pop(context);
  }

  void editConsumption(CustomerModelData customer) async{
    _entryConsumptionController.text = customer.previousConsumption.toString();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context){
        return Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              // this will prevent the soft keyboard from covering the text fields
              bottom: MediaQuery.of(context).viewInsets.bottom + 15,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _entryConsumptionController,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: "អំណានថ្មី"
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "អំណានថ្មីមិនអាចទទេបានទេ!";
                      }else if(int.parse(value) < customer.previousConsumption!.toInt()){
                        return "អំណានថ្មីមិនអាចតូចជាងអំណានចាស់ទេ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  SizedBox(
                    // height: 20,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        updateCustomer(customer.id);
                      }
                    }, child: const Text("Update")),
                  ),
                ],
              ),
            )
        );
      });

  }

  return Card(
    color: customer.newConsumption != 0 ? Colors.blue.shade200 : Colors.white,
    child: ListTile(
      onTap: () {
        editConsumption(customer);
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

