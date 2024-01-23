import 'package:flutter/material.dart';
import 'package:untitled3/model/user_model.dart';
import 'package:untitled3/services/log_services.dart';
import 'package:untitled3/services/pref_services.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 var user = User("2", "fsaidov167@gmail.com", "1234");
 PrefServices.storeName(user.toJson().toString());
 PrefServices.loadName().then((value) => {
   LogService.i(value!.toString())
 });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
}
