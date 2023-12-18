import 'package:flutter/material.dart';
import 'add user activity.dart';
import 'view user activity.dart';
import 'delete user activity.dart';
import 'update user activity.dart';

class SecondActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maya Electronics Company'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Add User Activity
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserActivity()),
                );
              },
              child: Text('Add User'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to View User Activity
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewUserActivity()),
                );
              },
              child: Text('View Users'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Delete User Activity
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteUserActivity()),
                );
              },
              child: Text('Delete User'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Update User Activity
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateUserActivity()),
                );
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
