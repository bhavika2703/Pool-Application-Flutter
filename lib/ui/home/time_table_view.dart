import 'dart:math';

import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ResourceViewBuilder extends StatefulWidget {
  const ResourceViewBuilder({Key? key}) : super(key: key);

  @override
  ResourceViewBuilderState createState() => ResourceViewBuilderState();
}

class ResourceViewBuilderState extends State<ResourceViewBuilder> {
  final List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.timelineDay,
    CalendarView.timelineWeek,
    CalendarView.timelineWorkWeek,
    CalendarView.timelineMonth,
  ];

  List<Appointment> _shiftCollection = <Appointment>[];
  final List<CalendarResource> _employeeCollection = <CalendarResource>[];
  final List<String> _nameCollection = <String>[];
  _DataSource? _events;

  @override
  void initState() {
    _addResourceDetails();
    _addResources();
    _addAppointments();
    _events = _DataSource(_shiftCollection, _employeeCollection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.timelineDay,
      showDatePickerButton: true,
      allowedViews: _allowedViews,
      dataSource: _events,
      resourceViewSettings: const ResourceViewSettings(
        size: 150,
      ),
      resourceViewHeaderBuilder: resourceBuilder,
    );
  }

  void _addResourceDetails() {
    _nameCollection.add('역삼청소년수련관 수영장');
    _nameCollection.add('코오롱스포렉스 서초점 실내수영장');
    _nameCollection.add('CH 수영교실');
    _nameCollection.add('스윔존');
    _nameCollection.add('오션키즈 대치점');
    _nameCollection.add('스위스키즈베이 대치점');
    _nameCollection.add('포이스포츠센터');
    _nameCollection.add('아이콕스어린이수영장');
    _nameCollection.add('동영휘트니스클럽수영장');
  }

  void _addResources() {
    for (int i = 0; i < _nameCollection.length; i++) {
      _employeeCollection.add(
        CalendarResource(
            displayName: _nameCollection[i],
            id: '$i',
            color: const Color.fromRGBO(236, 240, 243, 1)),
      );
    }
  }

  void _addAppointments() {
    _shiftCollection = <Appointment>[];
    final Random random = Random();
    for (int i = 0; i < _employeeCollection.length; i++) {
      final List<String> employeeIds = <String>[
        _employeeCollection[i].id.toString()
      ];
      DateTime shiftStartTime = getShiftStartTime(i + 1);
      _shiftCollection.add(
        Appointment(
            startTime: shiftStartTime,
            endTime: shiftStartTime.add(Duration(hours: getEndTime(i + 1))),
            subject: '',
            startTimeZone: '',
            endTimeZone: '',
            resourceIds: employeeIds),
      );
    }
  }

  DateTime getShiftStartTime(int i) {
    int newHour = 0;
    if (i == 1) {
      newHour = 8;
    } else if (i == 2) {
      newHour = 5;
    } else if (i == 3) {
      newHour = 8;
    } else if (i == 4) {
      newHour = 8;
    } else if (i == 5) {
      newHour = 8;
    } else if (i == 6) {
      newHour = 8;
    } else if (i == 7) {
      newHour = 8;
    } else if (i == 8) {
      newHour = 8;
    } else if (i == 9) {
      newHour = 8;
    }

    DateTime shiftStartTime = DateTime.now();
    shiftStartTime = shiftStartTime.toLocal();
    shiftStartTime = DateTime(
      shiftStartTime.year,
      shiftStartTime.month,
      shiftStartTime.day,
      newHour,
      shiftStartTime.minute,
      shiftStartTime.second,
      shiftStartTime.millisecond,
      shiftStartTime.microsecond,
    );
    return shiftStartTime;
  }

  Widget resourceBuilder(
      BuildContext context, ResourceViewHeaderDetails details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text(
            details.resource.displayName,
            style: Styles.cap2SemiBoldTextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: [
            Icon(Icons.access_time),
            Text(getTimeView(details)),
          ],
        ),
      ],
    );
  }

  int getEndTime(int i) {
    int newHour = 0;
    if (i == 1) {
      newHour = 8;
    } else if (i == 2) {
      newHour = 6;
    } else if (i == 3) {
      newHour = 10;
    } else if (i == 4) {
      newHour = 7;
    } else if (i == 5) {
      newHour = 6;
    } else if (i == 6) {
      newHour = 6;
    } else if (i == 7) {
      newHour = 7;
    } else if (i == 8) {
      newHour = 11;
    } else if (i == 9) {
      newHour = 6;
    }
    return newHour;
  }

  String getTimeView(ResourceViewHeaderDetails details) {
    String i = details.resource.id.toString();
    if (i == '1') {
      return '08:00-16:00';
    } else if (i == '2') {
      return '08:00-16:00';
    } else if (i == '3') {
      return '08:00-16:00';
    } else if (i == '4') {
      return '08:00-16:00';
    } else if (i == '5') {
      return '08:00-16:00';
    } else if (i == '6') {
      return '08:00-16:00';
    } else if (i == '7') {
      return '08:00-16:00';
    } else if (i == '8') {
      return '08:00-16:00';
    } else if (i == '9') {
      return '08:00-16:00';
    }
    return '08:00-16:00';
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}
