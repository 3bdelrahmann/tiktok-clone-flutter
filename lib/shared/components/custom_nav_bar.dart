import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/layout/cubit/cubit.dart';
import 'package:tiktok_clone/modules/add_video/add_video_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainLayoutCubit cubit = MainLayoutCubit.get(context);
    final barHeight = MediaQuery.of(context).size.height * 0.07;
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 10.0,
          fontWeight: FontWeight.w600,
        );

    return BottomAppBar(
      color: cubit.currentIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavBarItem(0, 'Home', style, Icons.home, context: context),
            _bottomNavBarItem(1, 'Discover', style, CupertinoIcons.search,
                context: context),
            _addVideoNavItem(barHeight, context: context),
            _bottomNavBarItem(
                3, 'Inbox', style, CupertinoIcons.ellipses_bubble_fill,
                context: context),
            _bottomNavBarItem(4, 'Profile', style, Icons.person,
                context: context),
          ],
        ),
      ),
    );
  }

  _bottomNavBarItem(int index, String label, TextStyle style, IconData icon,
      {required BuildContext context}) {
    int selectedPageIndex = MainLayoutCubit.get(context).currentIndex;
    bool isSelected = selectedPageIndex == index;
    Color itemColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      itemColor = Colors.white;
    }
    return GestureDetector(
      onTap: () => {onTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: itemColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            label,
            style: style.copyWith(
              color: itemColor,
            ),
          )
        ],
      ),
    );
  }
}

_addVideoNavItem(double height, {required BuildContext context}) {
  int selectedPageIndex = MainLayoutCubit.get(context).currentIndex;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return const AddVideoScreen();
            }),
      );
    },
    child: Container(
      height: height - 15,
      width: 48.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.redAccent],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Container(
          width: 41,
          height: height - 15,
          decoration: BoxDecoration(
            color: selectedPageIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.add,
            color: selectedPageIndex == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    ),
  );
}
