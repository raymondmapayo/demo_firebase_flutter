import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/add_data.dart';
import 'package:flutter_firebase_sample/alldata.dart';
import 'package:flutter_firebase_sample/employee.dart';
import 'package:flutter_firebase_sample/update_data.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

var txtstyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

buildUserInfo(Employee employee) => Column(
      children: [
        const Text('from firestore'),
        const SizedBox(height: 15),
        Text(employee.id, style: txtstyle),
        const SizedBox(height: 15),
        Text(employee.name, style: txtstyle),
      ],
    );

getUserData(uid) {
  var collection = FirebaseFirestore.instance.collection('Employee');
  return StreamBuilder(
      stream: collection.doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error = ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final data = snapshot.data!.data();
          if (data != null) {
            final employee = Employee(
              id: data['id'] ?? "",
              name: data['name'] ?? "",
              email: data['email'] ?? "",
              image: data['image'] ?? "",
            );
            return buildUserInfo(employee);
          } else {
            return const Text('Data is null');
          }
        }
        return const Center(child: CircularProgressIndicator());
      });
}

class _Page1State extends State<Page1> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Connection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AllData(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Successfully '),
            const SizedBox(height: 15),
            const Text('signed as:'),
            const SizedBox(height: 15),
            Text(
              user.email!,
              style: txtstyle,
            ),
            const SizedBox(height: 15),
            getUserData(user.uid),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('SIGN OUT'),
            ),
          ],
        ),
      ),
    );
  }
}
