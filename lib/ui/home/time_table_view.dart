import 'dart:math';

import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: must_be_immutable
class ResourceViewBuilder extends StatefulWidget {
  bool isFullScreenView = false;

  ResourceViewBuilder({required this.isFullScreenView});

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('자유수영 시간표', style: Styles.body1TextStyle()),
            Neumorphic(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(top: 6),
              child: NeumorphicButton(
                  onPressed: () {
                    bottomSheetView(context);
                  },
                  padding: EdgeInsets.all(4),
                  style: NeumorphicStyle(),
                  child: Row(
                    children: [
                      Text('03/12 (오늘)', style: Styles.cap2SemiBoldTextStyle()),
                      Icon(Icons.arrow_drop_down, color: Color(0xff6D7984)),
                    ],
                  )),
            ),
          ],
        ),
        Expanded(
          child: SfCalendar(
            headerHeight: 0,
            view: CalendarView.timelineDay,
            cellEndPadding: 0,
            showDatePickerButton: false,
            allowedViews: _allowedViews,
            dataSource: _events,
            allowAppointmentResize: false,
            resourceViewSettings: ResourceViewSettings(
              size: DeviceUtils.getDeviceWidth(context) / 2.5,
              visibleResourceCount: widget.isFullScreenView ? 6 : 2,
            ),
            timeSlotViewSettings: TimeSlotViewSettings(
              timeInterval: Duration(minutes: 60),
              timeFormat: 'h',
              dateFormat: 'dd/',
              dayFormat: 'yy',
              timeIntervalHeight: 10,
              timeIntervalWidth: 40,
              timelineAppointmentHeight: widget.isFullScreenView ? 40 : 24,
            ),
            cellBorderColor: Colors.grey.shade100,
            showCurrentTimeIndicator: true,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xff0BA5EC),
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            },
            resourceViewHeaderBuilder: resourceBuilder,
          ),
        ),
      ],
    );
  }

  void bottomSheetView(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 1),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 4, left: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      '날짜 선택',
                      style: Styles.body1TextStyle(),
                      textAlign: TextAlign.center,
                    )),
                    RoundedButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonIcon: Icons.close_rounded,
                      buttonColor: Colors.grey.shade700,
                    )
                  ],
                ),
              ),
              Flexible(
                child: SfCalendar(
                  view: CalendarView.month,

                  cellBorderColor: Colors.transparent,
                  showDatePickerButton: false,
                  monthViewSettings: MonthViewSettings(),
                  headerDateFormat: 'yyyy. ' 'MM',
                  /* monthCellBuilder: (context, details) {
                    return monthCellBuilder(context, details);
                  },*/
                  viewHeaderStyle: ViewHeaderStyle(),
                  showCurrentTimeIndicator: true,
                  //  monthCellBuilder:monthCellBuilder ,
                  headerStyle: CalendarHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: Styles.heading2TextStyle()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  monthCellBuilder(BuildContext context) {}

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
            color: Color(0xff0BA5EC),
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
    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            details.resource.displayName,
            style: Styles.cap2SemiBoldTextStyle(),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.access_time, size: 16, color: Color(0xff6D7984)),
              SizedBox(
                width: 2,
              ),
              Text(getTimeView(details),
                  style: Styles.caption3MediumTextStyle()),
            ],
          ),
          buildNeumorphicLineWidget(context),
        ],
      ),
    );
  }

  Widget buildNeumorphicLineWidget(
    BuildContext context,
  ) {
    return Neumorphic(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      style: NeumorphicStyle(
        depth: NeumorphicTheme.embossDepth(context),
      ),
      child: Container(
        height: 1,
        width: DeviceUtils.getDeviceWidth(context),
        color: Color(0xffECF0F3),
      ),
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
      return '05:00-10:30';
    } else if (i == '3') {
      return '08:00-18:00';
    } else if (i == '4') {
      return '08:00-15:00';
    } else if (i == '5') {
      return '08:00-14:00';
    } else if (i == '6') {
      return '08:00-15:00';
    } else if (i == '7') {
      return '08:00-19:00';
    } else if (i == '8') {
      return '08:00-14:00';
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
