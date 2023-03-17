import 'package:flutter/material.dart';
class PullCustomerPage extends StatefulWidget {
  const PullCustomerPage({Key? key}) : super(key: key);

  @override
  State<PullCustomerPage> createState() => _PullCustomerPageState();
}

class _PullCustomerPageState extends State<PullCustomerPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading ? const CircularProgressIndicator() : InkWell(
          onTap: (){
            debugPrint("Clicked");
            setState(() {
              isLoading = true;
            });
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
                Text("PULL CUSTOMER",
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
