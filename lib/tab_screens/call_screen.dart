import 'package:flutter/material.dart';
import 'package:whatsappclone/modal/CallModal.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6.0),
        child: ListView.builder(
          itemCount: dummyCallList.length,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(dummyCallList[index].avatarUrl),
                foregroundColor: Theme.of(context).primaryColor,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dummyCallList[index].name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ],
              ),
              subtitle: _getCallText(dummyCallList[index]),
              trailing: dummyCallList[index].isVideoCall == true? Icon(Icons.videocam, color: Theme.of(context).primaryColor): Icon(Icons.call, color: Theme.of(context).primaryColor),
            );
          },
        ));
  }

  Widget _getCallText(CallModel call) {
    if (call.callStatus == 'M') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.call_missed, color: Colors.red),
          Text(
            call.time,
            style: TextStyle(color: Colors.black54, fontSize: 15.0),
          )
        ],
      );
    } else if (call.callStatus == 'O') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.call_made, color: Colors.blue),
          Text(
            call.time,
            style: TextStyle(color: Colors.black54, fontSize: 15.0),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.call_received, color: Colors.green,),
          Text(
            call.time,
            style: TextStyle(color: Colors.black54, fontSize: 15.0),
          )
        ],
      );
    }
  }
}