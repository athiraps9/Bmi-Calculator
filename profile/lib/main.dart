import 'package:flutter/material.dart';
void main(){
  runApp(Profile());
}
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.green,
          appBar: AppBar(
            title: Text('profile'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/flowers.jpeg'),
              ),
                Text(

                  'noofa',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: Text(
                    'Flutter developer',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75.0,
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+44123456789"),
                   ),
                  ),
                ),
                SizedBox(
                  height: 75.0,
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.mail),
                      title: Text("noofa@gmail.com"),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
