import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/modal/menu.dart';
import 'package:whatsappclone/setting.dart';
import 'package:whatsappclone/tab_screens/call_screen.dart';
import 'package:whatsappclone/tab_screens/camera_screen.dart';
import 'package:whatsappclone/tab_screens/chat_screen.dart';
import 'package:whatsappclone/tab_screens/status_screen.dart';

class WhatsAppHomePage extends StatefulWidget {
  final camera;
  WhatsAppHomePage(this.camera);

  @override
  _WhatsAppHomePageState createState() => _WhatsAppHomePageState(camera);
}

class _WhatsAppHomePageState extends State<WhatsAppHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  final _cameraDescription;
  _WhatsAppHomePageState(this._cameraDescription);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("WhatsApp"),
          elevation: 1.0,
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS",),
              Tab(text: "STATUS",),
              Tab(text: "CALLS",)
            ],
            indicatorColor: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: ()=> print("Search called"),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),),
            PopupMenuButton<String>(
              onSelected: (result){
                if(result == "Settings"){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
                }else{
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Menu: $result"),));
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context){
                return _getPopupMenu();
              },
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CameraScreen(_cameraDescription),
            ChatScreen(),
            StatusScreen(),
            CallScreen()
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _getPopupMenu(){
    if(_tabController.index == 1){
      return mainMenu.map((String s){
        return PopupMenuItem<String>(
          value: s,
          child: Text(s),
        );
      }).toList();
    }else if(_tabController.index == 2){
      return mainMenuStatus.map((String s){
        return PopupMenuItem<String>(
          value: s,
          child: Text(s),
        );
      }).toList();
    }else{
      return mainMenuCall.map((String s){
        return PopupMenuItem<String>(
          value: s,
          child: Text(s),
        );
      }).toList();
    }
  }

  Future<bool> _onBackPressed(){
    if(_tabController.index != 1){
      _tabController.index = 1;
    }else{
      Navigator.of(context).pop();
    }
  }
}