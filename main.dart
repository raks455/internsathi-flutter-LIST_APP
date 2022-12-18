import 'package:flutter/material.dart';
import 'package:listapp/models/user.dart';
import 'package:listapp/actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFlutterList(),
      title: 'My Flutter List',
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {

  List<User> userList = [];


  @override
  Widget build(BuildContext context) {

    void addDataOfUser(User user) {

      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: UserAddBox(addDataOfUser),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 167, 223),
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,backgroundColor: Color.fromARGB(220, 5, 37, 111) ,
        child: Center(child: Icon(Icons.add)),
      ),
      appBar: AppBar(
   backgroundColor: Color.fromARGB(220, 5, 37, 111),
      title:Center(child: Text('User List')),
      ),
      body: Column(children: [
        SizedBox(height: 10),
      //creating static lists before addition of user
        Card(elevation: 8, color: Colors.white,child: ListTile(
            title: Text('Intern sathi',                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),),
            subtitle: Text('App Development',style: TextStyle(
                    fontSize: 16,

                  ),),
            trailing:Text('9804547477',
               style: TextStyle(
                    fontSize: 18,
                  ),)
          ),),
                  Card(elevation: 8, color: Colors.white,child: ListTile(
            title: Text('Candidate',                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),),
            subtitle: Text('Web Development',style: TextStyle(
                    fontSize: 16,

                  ),),
            trailing:Text('9804345627',
               style: TextStyle(
                    fontSize: 18,
                  ),)
          ),),
      //lists which will be added by the user 
      //we will access user's list from user models which we have created
      Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
             
          
           
           child:  ListTile(
                title: Text(
                  userList[index].name,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].faculty,
                  style: TextStyle(
                    fontSize: 16,

                  ),
                ),
                trailing: Text(
                  userList[index].phoneNo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            
             );
          },
          //desired no .of list can be added
          itemCount: userList.length,
        ),
      ),
      
      ])
    );
  }
}