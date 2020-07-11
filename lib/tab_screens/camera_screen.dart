import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsappclone/camera_preview/cam_preview.dart';

class CameraScreen extends StatefulWidget {
  final _cameraDescription;
  CameraScreen(this._cameraDescription);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget._cameraDescription,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_cameraController);
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.camera, color: Colors.white,),
        onPressed: () async{
          try{
            await _initializeControllerFuture;
            final path = join(
                (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png'
            );

            await _cameraController.takePicture(path);

            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> CamPreview(imagePath: path),
            ));
          }catch(e){
            print(e);
          }
        },
      ),
    );
  }
}
