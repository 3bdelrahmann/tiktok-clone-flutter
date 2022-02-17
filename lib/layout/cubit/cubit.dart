import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/layout/cubit/states.dart';

import '../../modules/add_video/add_video_screen.dart';
import '../../modules/discover/discover_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/inbox/inbox_screen.dart';
import '../../modules/profile/profile_screen.dart';

class MainLayoutCubit extends Cubit<MainLayoutStates> {
  MainLayoutCubit() : super(MainLayoutInitialState());

  static MainLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const AddVideoScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(MainLayoutChangeNavBarState());
  }
}
