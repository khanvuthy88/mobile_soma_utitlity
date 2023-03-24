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

  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  late List<CustomerModelData> customerList;

  @override
  void initState() {
    super.initState();
    _pageNumber = 0;
    customerList = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    fetchData();
  }

  void fetchData() async {
    final data = Provider.of<CustomerProvider>(context, listen: false).customerList;
    setState(() {
      customerList.addAll(data);
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("អតិថិជនទាំងអស់"),
      ),
      body: _loading ? const Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                debugPrint("clicked");
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.filter_alt_rounded, color: Colors.white,),
                    const SizedBox(width: 10),
                    Text("FILTER", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white
                    ),)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: customerList.length,
                  itemBuilder: ((context, index) {
                    final customer = customerList[index];
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
                  })
              ),
            ),
          ],
        ),
      ),
    );
  }
}
