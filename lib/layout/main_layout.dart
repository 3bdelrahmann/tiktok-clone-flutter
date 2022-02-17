import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/layout/cubit/cubit.dart';
import 'package:tiktok_clone/layout/cubit/states.dart';
import 'package:tiktok_clone/shared/components/custom_nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainLayoutCubit cubit = MainLayoutCubit.get(context);
    return BlocConsumer<MainLayoutCubit, MainLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: CustomNavBar(
          onTap: cubit.changeNavBar,
          currentIndex: cubit.currentIndex,
        ),
      ),
    );
  }
}
