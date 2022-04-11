import 'package:clubhouse_ui/Widgets/ImageProfileWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Room.dart';
import '../screens/RoomScreen.dart';

class RoomWidget extends StatelessWidget {
  final Room room;

  const RoomWidget({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => RoomScreen(room: room),
      )),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${room.club} 😵'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      )),
              Text('${room.name} 📚',
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          ImageProfileWidget(
                              imageUrl: room.speakers[0].imageURL, size: 50),
                          Positioned(
                              left: 25,
                              top: 25,
                              child: ImageProfileWidget(
                                imageUrl: room.speakers[1].imageURL,
                                size: 50,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                              (e) => Text('${e.firstName} ${e.lastName} 💸')),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(text: ' / ${room.speakers.length} '),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_text_fill,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
