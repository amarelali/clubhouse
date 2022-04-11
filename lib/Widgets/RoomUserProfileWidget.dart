import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'ImageProfileWidget.dart';

class RoomUserProfileWidget extends StatelessWidget {
  final bool isMuted;
  final bool isNew;
  final String name;
  final String imageURL;
  final double size;

  const RoomUserProfileWidget({
    Key? key,
    required this.name,
    required this.imageURL,
    this.size =70,
    this.isMuted = false,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      Stack(
        children: [
          ImageProfileWidget(
            imageUrl: imageURL,
            size: size,
          ),
          if (isNew)
            Positioned(
              bottom: 0,
              child: Container(
                width: 22,
                height: 22,
                child: Text('🎉'),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
            ),
          if (isMuted)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 22,
                height: 22,
                child: Icon(CupertinoIcons.mic_slash_fill, size: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black,
                        blurRadius: 4,
                      ),
                    ]),
              ),
            ),
        ],
      ),
      Flexible(
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12),
        ),
      ),
    ]);
  }
}
