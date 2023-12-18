import 'package:flutter/material.dart';
import 'database helper class.dart'; // Import your DatabaseHelper class

class ViewUserActivity extends StatefulWidget {
  @override
  _ViewUserActivityState createState() => _ViewUserActivityState();
}

class _ViewUserActivityState extends State<ViewUserActivity> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    List<Map<String, dynamic>> userList = await dbHelper.getUsers();

    setState(() {
      users = userList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return ListTile(
            title: Text('Full Name: ${user['Fullname']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${user['Username']}'),
                Text('Age: ${user['Age']}'),
                Text('Department: ${user['Department']}'),
                Text('Address: ${user['Address']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
