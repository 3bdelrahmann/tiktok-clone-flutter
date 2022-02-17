import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_clone/models/videoModel.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({Key? key, required this.video}) : super(key: key);
  final VideoModel video;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '@${video.postBy.userName}',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 8.0,
          ),
          ExpandableText(
            video.caption,
            expandText: 'more',
            collapseText: 'less',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Icon(
                CupertinoIcons.music_note_2,
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 20.0,
                child: Marquee(
                  text: '${video.audioName} • ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                  velocity: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
