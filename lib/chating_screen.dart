import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsappclone/clipping.dart';
import 'package:whatsappclone/modal/menu.dart';

class CChatScreen extends StatefulWidget {
  final String name;
  CChatScreen({@required this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState(name);
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class _ChatScreenState extends State<CChatScreen> {
  final String name;
  _ChatScreenState(this.name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff075e54), accentColor: Color(0xff25D366)),
        home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            elevation: 1.0,
            titleSpacing: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    "images/mypic.JPG"),
                backgroundColor: Colors.green,
              ),
              contentPadding: EdgeInsets.all(1.0),
              title: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              subtitle: Text(
                "last seen today at 17:12",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal),
                maxLines: 1,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
                iconSize: 24.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                iconSize: 24.0,
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return chatMenu.map((String s) {
                    return PopupMenuItem(
                      value: s,
                      child: s != "More" ? Text(s) : _customMenu(s),
                    );
                  }).toList();
                },
              )
            ],
          ),
          body: Chat(),
        ));
  }

  Widget _customMenu(String menu) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(menu),
        Icon(
          Icons.arrow_right,
          color: Colors.black,
        )
      ],
    );
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _list = <ChatMessage>[];
  IconData _sendingIcon = Icons.mic;

  @override
  void initState() {
    super.initState();
    //_textEditingController.addListener(changeSendIcon);
  }

  @override
  void dispose() {
    //_textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("images/wp_clone.png"))),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, index) => _list[index],
              itemCount: _list.length,
            ),
          ),
          Divider(
            height: 1.0,
          ),
          _textComposerWidget()
        ],
      ),
    );
  }

  // Worked but not exact
  Widget _textComposerWidgett() {
    return IconTheme(
      data: new IconThemeData(color: Color(0xff075e54)),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.tag_faces),
              color: Colors.black,
            ),
            Flexible(
              child: new TextField(
                style: TextStyle(fontSize: 18.0),
                decoration:
                    InputDecoration.collapsed(hintText: "Type a message"),
                controller: _textEditingController,
                //onSubmitted: _handleSubmitMsg,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () =>_textEditingController.text.isEmpty?null:_handleSubmitMsg(_textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textComposerWidget(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.insert_emoticon,
                          color: Colors.black54, size: 26.0,),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                          ),
                          onChanged: (text){
                            setState(() {
                              _changeSendIcon(text);
                            });
                          },
                        ),
                      ),
                      Icon(Icons.attach_file,
                          size: 26.0, color: Theme.of(context).hintColor),
                      SizedBox(width: 8.0),
                      Icon(Icons.camera_alt,
                          size: 26.0, color: Theme.of(context).hintColor),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ),
              )
          ),
          SizedBox(width: 5.0,),
          GestureDetector(
            onTap: ()=> _textEditingController.text.trim().isNotEmpty?_handleSubmitMsg(_textEditingController.text):null,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(_sendingIcon,),
            ),
          )
        ],
      ),
    );
  }

  _changeSendIcon(String text){
    _sendingIcon = text.isEmpty?Icons.mic:Icons.send;
  }

  _handleSubmitMsg(String msg) {
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(msg: msg);
    setState(() {
      _changeSendIcon(_textEditingController.text);
      _list.insert(0, message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String msg;
  ChatMessage({@required this.msg});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipChatMessage(6.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xbc99ddb0),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(7.0),
            bottomLeft: Radius.circular(7.0),
            bottomRight: Radius.circular(7.0),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              softWrap: true,
            ),
            Text(
              TimeOfDay.now().format(context),
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
