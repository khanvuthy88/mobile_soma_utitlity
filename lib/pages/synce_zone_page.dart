import 'package:flutter/material.dart';

class PullZonePage extends StatefulWidget {
  const PullZonePage({Key? key}) : super(key: key);

  @override
  State<PullZonePage> createState() => _PullZonePageState();
}

class _PullZonePageState extends State<PullZonePage> {
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
            child: Text("PULL ZONE", style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
            ), textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
