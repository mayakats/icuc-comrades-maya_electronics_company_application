import 'package:flutter/material.dart';
import 'database helper class.dart';

class UpdateUserActivity extends StatefulWidget {
  @override
  _UpdateUserActivityState createState() => _UpdateUserActivityState();
}

class _UpdateUserActivityState extends State<UpdateUserActivity> {
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
        title: Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Enter ID'),
            ),
            ElevatedButton(
              onPressed: () async {
                await fetchAndDisplayUserData();
              },
              child: Text('Fetch User Data'),
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
                await updateUserInDatabase();
                clearTextFields();
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchAndDisplayUserData() async {
    int id = int.parse(idController.text);
    Map<String, dynamic> userData = await dbHelper.getSingleUser(id);

    fullNameController.text = userData['Fullname'];
    usernameController.text = userData['Username'];
    passwordController.text = userData['Password'];
    ageController.text = userData['Age'].toString();
    departmentController.text = userData['Department'];
    addressController.text = userData['Address'];
  }

  Future<void> updateUserInDatabase() async {
    int result = await dbHelper.updateUser({
      'Regno': int.parse(idController.text),
      'Fullname': fullNameController.text,
      'Username': usernameController.text,
      'Password': passwordController.text,
      'Age': int.parse(ageController.text),
      'Department': departmentController.text,
      'Address': addressController.text,
    });

    if (result != 0) {
      print('User updated with ID: ${idController.text}');
    } else {
      print('No user found with ID: ${idController.text}');
    }
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
