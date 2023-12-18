import 'package:flutter/material.dart';
import 'database helper class.dart';

class DeleteUserActivity extends StatefulWidget {
  @override
  _DeleteUserActivityState createState() => _DeleteUserActivityState();
}

class _DeleteUserActivityState extends State<DeleteUserActivity> {
  final dbHelper = DatabaseHelper();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await deleteUserFromDatabase();
                clearTextField();
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteUserFromDatabase() async {
    int result = await dbHelper.deleteUser(int.parse(idController.text));

    if (result != 0) {
      print('User deleted with ID: ${idController.text}');
    } else {
      print('No user found with ID: ${idController.text}');
    }
  }

  void clearTextField() {
    idController.clear();
  }
}
