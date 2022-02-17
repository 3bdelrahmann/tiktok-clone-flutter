import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/modules/home/cubit/states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  bool isFollowingSelected = true;
  int snappedIndex = 0;

  void selectFollowingTab() {
    isFollowingSelected = true;
    emit(HomeScreenToggleTabsState());
  }

  void selectForYouTab() {
    isFollowingSelected = false;
    emit(HomeScreenToggleTabsState());
  }

  void getSnappedIndex(int page) {
    snappedIndex = page;
    emit(HomeScreenGetSnappedIndexState());
  }
}
