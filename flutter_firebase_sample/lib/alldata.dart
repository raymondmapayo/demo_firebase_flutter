import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/add_data.dart';
import 'package:flutter_firebase_sample/employee.dart';
import 'package:flutter_firebase_sample/update_data.dart';

class AllData extends StatefulWidget {
  const AllData({Key? key}) : super(key: key);

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  Stream<List<Employee>> readUsers() {
    return FirebaseFirestore.instance.collection('Employee').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList());
  }

  Future<void> _deleteUser(String id) async {
    final docUser = FirebaseFirestore.instance.collection('Employee').doc(id);
    docUser.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Firebase Data'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddData(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: StreamBuilder<List<Employee>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final employees = snapshot.data!;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return buildList(context, employees[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildList(BuildContext context, Employee employee) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(employee.image),
        radius: 25,
      ),
      title: Text(employee.name),
      subtitle: Text(employee.email),
      dense: true,
      onTap: () {
        // Handle tap action if needed
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateData(employee: employee),
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {
              _deleteUser(employee.id);
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
