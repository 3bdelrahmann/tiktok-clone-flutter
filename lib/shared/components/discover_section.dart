import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///header
        _buildHeader(context, height * 0.2),

        ///horizontal list
        Container(
          height: height * 0.65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://picsum.photos/seed/${index + 1}/300/400')),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _buildHeader(BuildContext context, double height) {
    return ListTile(
      minLeadingWidth: double.minPositive,
      leading: Container(
        height: height + 8,
        width: height + 8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(height),
        ),
        child: Icon(Icons.tag),
      ),
      title: Text(
        'SundayBrunch',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
        'Trending hashtag',
        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12.0),
      ),
      trailing: Container(
        height: height / 2,
        color: Colors.grey.shade300,
        padding: EdgeInsets.only(left: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '2.6M',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Icon(
              Icons.chevron_right,
              size: 17.0,
            ),
          ],
        ),
      ),
    );
  }
}
