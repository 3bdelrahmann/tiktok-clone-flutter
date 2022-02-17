import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/models/videoModel.dart';

class HomeScreenSideBar extends StatefulWidget {
  const HomeScreenSideBar({Key? key, required this.video}) : super(key: key);
  final VideoModel video;

  @override
  _HomeScreenSideBarState createState() => _HomeScreenSideBarState();
}

class _HomeScreenSideBarState extends State<HomeScreenSideBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13.0, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(postByUrl: widget.video.postBy.userImage),
          _sideBarItem(
              iconName: 'favorite', label: widget.video.likes, style: style),
          _sideBarItem(
              iconName: 'comment', label: widget.video.comments, style: style),
          _sideBarItem(iconName: 'share', label: '241', style: style),
          AnimatedBuilder(
            animation: _animationController,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  child: SvgPicture.asset('assets/images/disc.svg',
                      color: Colors.black),
                ),
                CircleAvatar(
                  radius: 12.0,
                  backgroundImage: NetworkImage(widget.video.postBy.userImage),
                ),
              ],
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: 2 * pi * _animationController.value,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}

_sideBarItem(
    {required String iconName,
    required String label,
    required TextStyle style}) {
  return Column(
    children: [
      SvgPicture.asset(
        'assets/images/$iconName.svg',
        height: 35.0,
        width: 35.0,
        color: Colors.white.withOpacity(0.7),
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        label,
        style: style,
      ),
    ],
  );
}

_profileImageButton({required String postByUrl}) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(postByUrl),
          ),
        ),
      ),
      Positioned(
        bottom: -10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            Icons.add,
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
