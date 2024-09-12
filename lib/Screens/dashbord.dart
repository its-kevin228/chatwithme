// ignore_for_file: camel_case_types


import 'package:chatwithme/Screens/Splach.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  //variable de recuperation des données utilisateurs
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dashbord'),
      ),
      body: Column(
        children: [
          const Text('welcome'),
          Text((user?.email ?? "").toString()),
          ElevatedButton(
              onPressed: () async {
                //deconnexion firebase
                await FirebaseAuth.instance.signOut();

                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const Splach();
                }), (route) {
                  return false;
                });
              },
              child: const Text('sign out'))
        ],
      ),
    );
  }
}
