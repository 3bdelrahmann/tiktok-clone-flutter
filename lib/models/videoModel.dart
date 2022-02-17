import 'package:tiktok_clone/models/userModel.dart';

class VideoModel {
  final String videoUrl;
  final UserModel postBy;
  final String caption;
  final String audioName;
  final String likes;
  final String comments;

  VideoModel({
    required this.videoUrl,
    required this.postBy,
    required this.caption,
    required this.audioName,
    required this.likes,
    required this.comments,
  });
}
