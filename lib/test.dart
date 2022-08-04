import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/app/app.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);


  void updateMyAppState() {
    MyApp.instance.state = 0; // Set MyApp state value to 10;
  }

  void getMyAppstate() {
    print(MyApp.instance.state); // This will print 10;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
