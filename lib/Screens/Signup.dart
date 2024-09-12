// ignore_for_file: use_build_context_synchronously

import 'package:chatwithme/Screens/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future<void> createaccount() async {
    try {
      //initialiser le compte firebase

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const dashboard();
      }), (route) {
        return false;
      });
      print('login succefully');
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
//message d'erreur
      SnackBar errormessage = const SnackBar(content: Text('error'));
      ScaffoldMessenger.of(context).showSnackBar(errormessage);
    }
  }

//cle de formulaire
  final _formKey = GlobalKey<FormState>();
  //recuperation de données
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // Add more validation logic if needed
                  return null;
                },
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  // Add more password validation logic if needed
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create account logic here
                    createaccount();
                  }
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
