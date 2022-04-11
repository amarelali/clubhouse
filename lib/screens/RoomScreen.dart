import 'dart:math';

import 'package:clubhouse_ui/Widgets/RoomUserProfileWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/ImageProfileWidget.dart';
import '../data.dart';
import '../models/Room.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 20,
          ),
          label: Text('Hallway'),
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
        ),
        actions: [
          Icon(CupertinoIcons.doc),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  ImageProfileWidget(imageUrl: currentUser.imageURL, size: 36),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    '${room.name}'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                children: room.speakers
                    .map((e) => RoomUserProfileWidget(
                          name: '${e.firstName} ${e.lastName}',
                          isMuted: Random().nextBool(),
                          isNew: Random().nextBool(),
                          imageURL: e.imageURL,
                          size: 60,
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Followed By Speakers'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 10,
                          color: Colors.blueGrey,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                // childAspectRatio: 0.9,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfileWidget(
                          name: '${e.firstName} ${e.lastName}',
                          isMuted: Random().nextBool(),
                          isNew: Random().nextBool(),
                          imageURL: e.imageURL,
                          size: 55,
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Others'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 10,
                        color: Colors.blueGrey,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                // childAspectRatio: 0.9,
                children: room.others
                    .map((e) => RoomUserProfileWidget(
                          name: '${e.firstName} ${e.lastName}',
                          isMuted: Random().nextBool(),
                          isNew: Random().nextBool(),
                          imageURL: e.imageURL,
                          size: 55,
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 55))
          ],
        ),

      ),
      bottomSheet: Container(
        height: 90,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '👆 leave quitely',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Container(
                  child: Icon(
                    CupertinoIcons.add,
                    size: 25,
                  ),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),

                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  child: Icon(
                    CupertinoIcons.hand_raised,
                    size: 25,
                  ),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
