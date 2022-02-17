import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'build_icon_with_text.dart';

class BuildCameraPreview extends StatelessWidget {
  const BuildCameraPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 13.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 75.0,
            start: 24.0,
            end: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Icon(
                        CupertinoIcons.music_note_2,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    Text(
                      'Add Sound',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildIconWithText(
                      icon: 'flip',
                      label: 'Flip',
                      style: style,
                      size: 20,
                      color: Colors.white,
                    ),
                    BuildIconWithText(
                      icon: 'beauty',
                      label: 'Beauty',
                      style: style,
                      size: 20,
                      color: Colors.white,
                    ),
                    BuildIconWithText(
                      icon: 'filter',
                      label: 'Filter',
                      style: style,
                      size: 20,
                      color: Colors.white,
                    ),
                    BuildIconWithText(
                      icon: 'flash',
                      label: 'Flash',
                      style: style,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
