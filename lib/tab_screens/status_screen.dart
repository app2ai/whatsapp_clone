import 'package:flutter/material.dart';
import 'package:whatsappclone/modal/StatusModal.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
            ),
            title: Text(
              "My Status",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            subtitle: Text(
              "tap to add status update",
              style: TextStyle(color: Colors.black54, fontSize: 14.0),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0, bottom: 6.0),
            color: Color(0xffeeeeee),
            child: Text("Recent updates", textAlign: TextAlign.start, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 14.0),),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: statusList.length,
            itemBuilder: (context, int index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(statusList[index].statusUrl),
                  backgroundColor: Theme.of(context).primaryColor,
                  maxRadius: 20.0,
                ),
                title: Text(statusList[index].contactName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),),
                subtitle: Text(statusList[index].timing,
                    style: TextStyle(color: Colors.black54, fontSize: 14.0),),
              );
            },
          )
        ],
      ),
    );
  }
}
