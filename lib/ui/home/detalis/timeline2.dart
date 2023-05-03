import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}

class Timeline2 extends StatelessWidget {
  const Timeline2({key});

  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [
      _TimelineStatus.done,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.todo
    ];

    return Container(
      height: 280,
      color: const Color.fromRGBO(236, 240, 243, 0.6),
      padding: const EdgeInsets.all(10.0),
      child: Timeline.tileBuilder(
        physics: const NeverScrollableScrollPhysics(),
        theme: TimelineThemeData(
          nodePosition: 0,
          color: const Color(0xffc2c5c9),
          connectorTheme: const ConnectorThemeData(
            thickness: 2.0,
          ),
        ),
        padding: const EdgeInsets.only(top: 20.0),
        builder: TimelineTileBuilder.connected(
          indicatorBuilder: (context, index) {
            if (index == 0) {
              return const OutlinedDotIndicator(
                color: Color(0xff0BA5EC),
              );
            } else if (index == 2) {
              return const OutlinedDotIndicator(
                color: Color(0xff0BA5EC),
              );
            } else {
              return const DotIndicator(
                color: Color(0xff0BA5EC),
              );
            }
          },
          connectorBuilder: (BuildContext context, index, connectorType) {
            var color = const Color(0xff0BA5EC);
            return SolidLineConnector(
              indent: connectorType == ConnectorType.start ? 0 : 2.0,
              endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
              color: color,
            );
          },
          contentsBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      '월-금',
                      style: buildTextStyle(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text('08:00 - 17:00', style: buildSubTextStyle()),
                    ),
                  ],
                ),
              );
            } else if (index == 1) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '토요일',
                      style: buildTextStyle(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              '1부 자유수영 06:00 - 08:50',
                              style: buildSubTextStyle(),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              '2부 자유수영 10:00 - 12:50',
                              style: buildSubTextStyle(),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              '3부 자유수영 14:00 - 17:50',
                              style: buildSubTextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      '일요일',
                      style: buildTextStyle(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        '08:00 - 17:00',
                        style: buildSubTextStyle(),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          itemExtentBuilder: (BuildContext context, int index) {
            /*  if (index == 1) {
              return 180;
            } else {
              return 50;
            }*/
            if (index == 0) {
              return 40;
            } else if (index == 1) {
              return 160;
            } else {
              return 50;
            }
          },
          itemCount: 3,
        ),
      ),
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  }

  TextStyle buildSubTextStyle() {
    return const TextStyle(
        color: Color(0xFF4A525C), fontSize: 14, fontWeight: FontWeight.normal);
  }
}

const kTileHeight = 200.0;

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: const Color(0xffe6e7e9),
      ),
    );
  }
}
