import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../../shared/components/discover_section.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  PageController _pageViewController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageViewController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0.25,
          pinned: true,
          centerTitle: false,
          title: Container(
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.grey.shade500,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey.shade500,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                border: InputBorder.none,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
              ),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.qrcode_viewfinder,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: (int page) {
                    _currentPageNotifier.value = page;
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://bit.ly/33hpzqX'),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: CirclePageIndicator(
                    currentPageNotifier: _currentPageNotifier,
                    itemCount: 5,
                    size: 5,
                    selectedSize: 5,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height / 3.56,
                child: DiscoverSection(
                  height: MediaQuery.of(context).size.height / 3.75,
                ),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
