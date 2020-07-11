import 'package:flutter/material.dart';
import 'package:whatsappclone/chating_screen.dart';
import 'package:whatsappclone/modal/ChatModal.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, int index){
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(dummyList[index].avatarUrl),
              foregroundColor: Theme.of(context).primaryColor,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dummyList[index].name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),),
                Text(dummyList[index].time, style: TextStyle(color: Colors.grey, fontSize: 12.0),)
              ],
            ),
            subtitle: Text(dummyList[index].lastChat, style: TextStyle(color: Colors.black54, fontSize: 15.0),),
            onTap: (){
              // Open new chat screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CChatScreen(name: dummyList[index].name,)));
            },
           );
        },
      )
    );
  }
}
