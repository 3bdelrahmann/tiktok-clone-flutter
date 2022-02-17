import 'package:flutter/material.dart';

class BuildCameraTypeSelector extends StatefulWidget {
  const BuildCameraTypeSelector({Key? key}) : super(key: key);

  @override
  State<BuildCameraTypeSelector> createState() =>
      _BuildCameraTypeSelectorState();
}

class _BuildCameraTypeSelectorState extends State<BuildCameraTypeSelector> {
  final List<String> cameraTypes = ['Photo', 'Video'];
  final PageController _pageViewController =
      PageController(initialPage: 1, viewportFraction: 0.2);

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 13.0,
          color: Colors.white,
        );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 25,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        SizedBox(
          height: 45.0,
          child: PageView.builder(
              controller: _pageViewController,
              itemCount: cameraTypes.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  child: Text(
                    cameraTypes[index],
                    style: style.copyWith(color: Colors.white),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
