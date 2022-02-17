import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_clone/layout/cubit/cubit.dart';
import 'package:tiktok_clone/layout/cubit/states.dart';
import 'package:tiktok_clone/layout/main_layout.dart';

import 'modules/home/cubit/cubit.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const TiktokClone());
}

class TiktokClone extends StatelessWidget {
  const TiktokClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return MainLayoutCubit();
          }),
          BlocProvider(create: (context) {
            return HomeScreenCubit();
          }),
        ],
        child: BlocConsumer<MainLayoutCubit, MainLayoutStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.varelaRoundTextTheme(),
            ),
            home: MainLayout(),
          ),
        ));
  }
}
