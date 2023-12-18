import 'package:flutter/material.dart';
import 'database helper class.dart';

class AddUserActivity extends StatefulWidget {
  @override
  _AddUserActivityState createState() => _AddUserActivityState();
}

class _AddUserActivityState extends State<AddUserActivity> {
  final dbHelper = DatabaseHelper();
  TextEditingController idController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: departmentController,
                decoration: InputDecoration(labelText: 'Department'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await addUserToDatabase();
                  clearTextFields();
                },
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUserToDatabase() async {
    int result = await dbHelper.insertUser({
      'Fullname': fullNameController.text,
      'Username': usernameController.text,
      'Password': passwordController.text,
      'Age': int.parse(ageController.text),
      'Department': departmentController.text,
      'Address': addressController.text,
    });

    print('User added with ID: $result');
  }

  void clearTextFields() {
    idController.clear();
    fullNameController.clear();
    usernameController.clear();
    passwordController.clear();
    ageController.clear();
    departmentController.clear();
    addressController.clear();
  }
}
