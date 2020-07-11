import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/whatsapp_home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cam = await availableCameras();
  final primaryCam = cam.first;
  runApp(Whatsapp(primaryCam));
}

class Whatsapp extends StatefulWidget {
  final cam;
  Whatsapp(this.cam);
  @override
  _WhatsappState createState() => _WhatsappState(cam);
}

class _WhatsappState extends State<Whatsapp> {

  final cam;
  _WhatsappState(this.cam);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      home: WhatsAppHomePage(cam),
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xff25D366)
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}