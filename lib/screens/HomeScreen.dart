import 'package:clubhouse_ui/Constance.dart';
import 'package:clubhouse_ui/Widgets/RoomWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/ImageProfileWidget.dart';
import '../data.dart';

class HomeSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.search, size: 28),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.envelope_open, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.calendar, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell, size: 28),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  ImageProfileWidget(imageUrl: currentUser.imageURL, size: 36),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              ...roomList.map((e) => RoomWidget(
                    room: e,
                  )),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(CupertinoIcons.add, size: 13),
              label: Text('Start a new room'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(12),
                  primary: Theme.of(context).colorScheme.secondary),
            ),
          )
        ],
      ),
    );
  }
}
