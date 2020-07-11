import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Settings",
      theme: ThemeData(
          primaryColor: Color(0xff075e54),
          accentColor: Color(0xff25D366)
      ),
      debugShowCheckedModeBanner: false,
      home: SettingsHomePage(),
    );
  }
}

class SettingsHomePage extends StatefulWidget {
  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: ()=> Navigator.of(context).pop(true),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(padding: EdgeInsets.only(top: 8.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/236x/90/11/32/901132cfc4031c15ce2b7d51029f6c45.jpg"),
                  radius: 26.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 16.0, top: 0.0, right: 0.0, bottom: 0.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Vishal Rana", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),),
                    Container(padding: EdgeInsets.symmetric(vertical: 2.0),),
                    Text("Android/Software Developer", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54, fontSize: 14.0))
                  ],
                )
              ],
            ),
            Container(margin: EdgeInsets.symmetric(vertical: 4.0),),
            Divider(color: Colors.black12, thickness: 0.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.vpn_key, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.chat, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("Chats", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.notifications, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("Notifications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.data_usage, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("Data usage", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.help, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("About and help", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  child: Icon(Icons.supervisor_account, size: 30.0, color: Theme.of(context).primaryColor,),
                ),
                Text("Contacts", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18.0),),
              ],
            ),
            Divider(color: Colors.black12, thickness: 0.5, indent: 60.0),
          ],
        ),
      ),
    );
  }
}

