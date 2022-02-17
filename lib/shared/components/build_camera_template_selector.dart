import 'package:flutter/material.dart';

class BuildCameraTemplateSelector extends StatefulWidget {
  const BuildCameraTemplateSelector({Key? key}) : super(key: key);

  @override
  _BuildCameraTemplateSelectorState createState() =>
      _BuildCameraTemplateSelectorState();
}

class _BuildCameraTemplateSelectorState
    extends State<BuildCameraTemplateSelector> {
  final List<String> postTypes = ['Camera', 'Quick', 'Templates'];
  final PageController _pageViewController =
      PageController(initialPage: 1, viewportFraction: 0.2);
  int _selectedTab = 1;

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
          fontWeight: FontWeight.bold,
        );
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 45.0,
            child: PageView.builder(
                onPageChanged: (page) {
                  setState(() {
                    _selectedTab = page;
                  });
                },
                controller: _pageViewController,
                itemCount: postTypes.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0,
                    child: Text(
                      postTypes[index],
                      style: style.copyWith(
                          color: _selectedTab == index
                              ? Colors.white
                              : Colors.grey),
                    ),
                  );
                }),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 50.0,
            height: 45.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
