import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soma_utility/db/app_db.dart';
import 'package:soma_utility/providers/customer_provider.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomerProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Customer all'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
            future: context.watch<AppDb>().getCustomers(),
            builder: (context, snapshot) {
              final List<CustomerModelData>? customers = snapshot.data;
              print(customers);
              if(snapshot.connectionState != ConnectionState.done){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if(customers != null){
                return ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index){
                      final customer = customers[index];
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
                    }
                );
              }
              return const Center(
                child: Text("No Data found"),
              );
            },
          )
        ),
      ),
    );
  }
}
