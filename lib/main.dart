import 'package:chatwithme/Screens/Splach.dart';
import 'package:chatwithme/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //s'assurer que ca demarre toujours bien
  WidgetsFlutterBinding.ensureInitialized();
  //initialiser firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: "Poppins"),
      home: const Splach(),
    );
  }
}
