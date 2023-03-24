import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/db/app_db.dart';

class CustomerByZoneDoneReadPage extends StatefulWidget {
  final String zoneName;
  const CustomerByZoneDoneReadPage({Key? key, required this.zoneName}) : super(key: key);

  @override
  State<CustomerByZoneDoneReadPage> createState() => _CustomerByZoneDoneReadPageState();
}

class _CustomerByZoneDoneReadPageState extends State<CustomerByZoneDoneReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("បានអានរួចរាល់សម្រាប់តំបន់ ${widget.zoneName}"),
      ),
      body: FutureBuilder(
        future: Provider.of<AppDb>(context).getCustomerByZoneDoneRead('zone2'),
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            if(snapshot.hasData){
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
                child: Text("មិនមានទិន្នន័យសម្រាប់តំបន់នេះ"),
              );
            }
          }
        },
      ),
    );
  }
}
