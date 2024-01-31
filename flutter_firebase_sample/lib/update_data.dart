import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/employee.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({
    Key? key,
    required this.employee,
  }) : super(key: key);

  final Employee employee;

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late String errorMessage;
  late bool isError;

  @override
  void initState() {
    super.initState();
    errorMessage = "This is an error";
    isError = false;
    nameController = TextEditingController(text: widget.employee.name);
    emailController = TextEditingController(text: widget.employee.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future updateUser(String id) async {
    final docUser = FirebaseFirestore.instance.collection("Employee").doc(id);
    docUser.update({
      'email': emailController.text,
      'name': nameController.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GO BACK'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'UPDATE DATA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 38,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  updateUser(widget.employee.id);
                },
                child: const Text('UPDATE'),
              ),
              const SizedBox(height: 15),
              if (isError)
                Text(
                  errorMessage,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
