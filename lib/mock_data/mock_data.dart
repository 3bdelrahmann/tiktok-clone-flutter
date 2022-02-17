import 'package:tiktok_clone/models/userModel.dart';

import '../models/videoModel.dart';

UserModel currentUser = UserModel(
    userName: 'abdelrahman_nasser',
    userImage:
        'https://media-exp1.licdn.com/dms/image/C4E03AQFr9V6QxqAsOA/profile-displayphoto-shrink_800_800/0/1630368674373?e=1650499200&v=beta&t=U0IXe0ML5IKYxeVquH7c06mrCQzh-PhVUsC8pdyD8J8');
UserModel demoUser1 = UserModel(
    userName: 'user_1',
    userImage:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
UserModel demoUser2 = UserModel(
    userName: 'user_2',
    userImage:
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80');
UserModel demoUser3 = UserModel(
    userName: 'user_3',
    userImage:
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80');
UserModel demoUser4 = UserModel(
    userName: 'user_4',
    userImage:
        'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80');

List<VideoModel> videos = [
  VideoModel(
      videoUrl: 'v1.mp4',
      postBy: demoUser1,
      caption: 'caption',
      audioName: 'audioName',
      likes: '12.5k',
      comments: '265'),
  VideoModel(
      videoUrl: 'v2.mp4',
      postBy: demoUser2,
      caption: 'caption',
      audioName: 'audioName',
      likes: '5.6M',
      comments: '255.4k'),
  VideoModel(
      videoUrl: 'v3.mp4',
      postBy: demoUser3,
      caption: 'caption',
      audioName: 'audioName',
      likes: '102',
      comments: '10'),
  VideoModel(
      videoUrl: 'v4.mp4',
      postBy: demoUser4,
      caption: 'caption',
      audioName: 'audioName',
      likes: '232',
      comments: '25'),
];
