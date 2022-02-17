import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/shared/components/video_tile.dart';

import '../../mock_data/mock_data.dart';
import '../../shared/components/home_screen_side_bar.dart';
import '../../shared/components/video_details.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenCubit cubit = HomeScreenCubit.get(context);
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.selectFollowingTab();
                      },
                      child: Text(
                        'Following',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: cubit.isFollowingSelected ? 18.0 : 14.0,
                              color: cubit.isFollowingSelected
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                      ),
                    ),
                    Text(
                      ' | ',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.selectForYouTab();
                      },
                      child: Text(
                        'For You',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize:
                                  !cubit.isFollowingSelected ? 18.0 : 14.0,
                              color: !cubit.isFollowingSelected
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              body: PageView.builder(
                  onPageChanged: (int page) {
                    cubit.getSnappedIndex(page);
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoTile(
                          video: videos[index],
                          currentIndex: index,
                          snappedIndex: cubit.snappedIndex,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: VideoDetails(
                                  video: videos[index],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.75,
                                child: HomeScreenSideBar(
                                  video: videos[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ));
  }
}
