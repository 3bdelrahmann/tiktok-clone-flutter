import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/main.dart';
import 'package:tiktok_clone/shared/components/build_camera_preview.dart';

import 'build_camera_template_selector.dart';
import 'build_camera_type_selector.dart';
import 'build_icon_with_text.dart';

class BuildCamera extends StatefulWidget {
  const BuildCamera({Key? key}) : super(key: key);

  @override
  _BuildCameraState createState() => _BuildCameraState();
}

class _BuildCameraState extends State<BuildCamera> {
  final CameraController _cameraController =
      CameraController(cameras.first, ResolutionPreset.medium);

  @override
  void initState() {
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) return _cameraPreview();
    return Container();
  }

  Widget _cameraPreview() {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 13.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
    return CameraPreview(
      _cameraController,
      child: Column(
        children: [
          BuildCameraPreview(),
          Spacer(),
          BuildCameraTypeSelector(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 30.0, top: 10.0, left: 30.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildIconWithText(
                    icon: 'effects',
                    label: 'Effects',
                    style: style.copyWith(fontSize: 11.0),
                    size: 35),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                BuildIconWithText(
                    icon: 'upload',
                    label: 'Upload',
                    style: style.copyWith(fontSize: 11.0),
                    size: 35),
              ],
            ),
          ),
          BuildCameraTemplateSelector(),
        ],
      ),
    );
  }
}
