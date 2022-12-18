import 'package:flutter/material.dart';

import 'package:listapp/models/user.dart';

//this page is responsible for addiiton of user defined data

class UserAddBox extends StatefulWidget {

  final Function(User) addUser;

  UserAddBox(this.addUser);

  @override
  _UserAddBoxState createState() => _UserAddBoxState();
}

class _UserAddBoxState extends State<UserAddBox> {


  @override
  Widget build(BuildContext context) {

    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var nameController = TextEditingController();
    var facultyController = TextEditingController();
    var phoneNoController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            //text field is build and user to enter the data from the user ehich is going to be displayed in the list
            buildTextField('Name', nameController),
            buildTextField('Faculty', facultyController),
          
            buildTextField('Phone No', phoneNoController),
            //input button
            ElevatedButton(
              onPressed: () {

                final user = User(nameController.text, facultyController.text,
                    phoneNoController.text);
                widget.addUser(user);
                Navigator.of(context).pop();

              },
            
              child: Text('Add Here '),
            ),
          ],
        ),
      ),
    );
  }
}