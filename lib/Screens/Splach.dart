import 'package:chatwithme/Screens/dashbord.dart';
import 'package:chatwithme/Screens/login.dart';
import 'package:flutter/material.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      opendashboard(); // ou openlogin() selon votre logique
    });
  }

  void opendashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const dashboard()),
    );
  }

  void openlogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
