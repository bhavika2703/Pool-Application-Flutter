import 'dart:math';

import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  DateRangePickerController _controller = DateRangePickerController();
  String headerString = '';

  @override
  void initState() {
    headerString = DateFormat('yyyy. MM').format(DateTime.now()).toString();
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
                  style: NeumorphicStyle(color: Color(0xffE1E7EC)),
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
            cellBorderColor: Color(0xffE1E7EC),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        final double width = MediaQuery.of(context).size.width;
        final double cellWidth = width / 12;
        return Container(
          margin: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 1),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 4, left: 4),
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
                    NeumorphicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: roundedButtonStyle(context),
                      padding: const EdgeInsets.all(14),
                      child:
                          Icon(Icons.close, color: Color(0xff6D7984), size: 20),
                    )
                  ],
                ),
              ),
              calenderBottomSheetHeaderView(cellWidth, context),
              Flexible(
                child: SfDateRangePicker(
                  controller: _controller,
                  enablePastDates: false,
                  onViewChanged: viewChanged,
                  todayHighlightColor: Colors.blue,
                  headerHeight: 0,
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                      blackoutDateTextStyle: TextStyle(
                    color: Colors.grey,
                  )),
                  selectionColor: Colors.transparent,
                  selectionMode: DateRangePickerSelectionMode.single,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    showTrailingAndLeadingDates: true,
                  ),
                  cellBuilder: cellBuilder,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container calenderBottomSheetHeaderView(
      double cellWidth, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: cellWidth,
            width: cellWidth + 10,
          ),
          NeumorphicButton(
            onPressed: () {
              _controller.backward!();
            },
            style: roundedButtonStyle(context),
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios_new_rounded,
                color: Color(0xff6D7984), size: 17),
          ),
          Container(
            height: cellWidth,
            width: cellWidth * 4,
            child: Text(headerString,
                textAlign: TextAlign.center, style: Styles.heading2TextStyle()),
          ),
          NeumorphicButton(
            onPressed: () {
              _controller.forward!();
            },
            style: roundedButtonStyle(context),
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward_ios_rounded,
                color: Color(0xff6D7984), size: 17),
          ),
          Container(
            height: cellWidth,
            width: cellWidth,
          )
        ],
      ),
    );
  }

  NeumorphicStyle roundedButtonStyle(BuildContext context) {
    return NeumorphicStyle(
        color: Colors.white,
        depth: NeumorphicTheme.depth(context),
        boxShape: NeumorphicBoxShape.circle());
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    final DateTime visibleEndDate = args.visibleDateRange.endDate!;
    final int totalVisibleDays =
        (visibleStartDate.difference(visibleEndDate).inDays);
    final DateTime midDate =
        visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
    headerString = DateFormat('yyyy. MM').format(midDate).toString();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  Widget cellBuilder(
      BuildContext context, DateRangePickerCellDetails cellDetails) {
    bool IsSelected = _controller.selectedDate != null &&
        cellDetails.date.year == _controller.selectedDate?.year &&
        cellDetails.date.month == _controller.selectedDate?.month &&
        cellDetails.date.day == _controller.selectedDate?.day;
    if (IsSelected) {
      return NeumorphicButton(
        // minDistance: -5.0,
        padding: EdgeInsets.all(8),
        style: NeumorphicStyle(
          color: Colors.white,
          depth: NeumorphicTheme.embossDepth(context),
          //shape: NeumorphicShape.convex,
          //  shadowDarkColorEmboss: Colors.grey,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            DateFormat('dd').format(cellDetails.date),
            style: Styles.body2MediumTextStyle()
                .copyWith(color: Colors.black, fontSize: 12),
          ),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            DateFormat('dd').format(cellDetails.date),
            style: Styles.body2MediumTextStyle()
                .copyWith(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
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
        color: Colors.transparent,
        depth: NeumorphicTheme.embossDepth(context),
      ),
      child: Container(
        height: 1.2,
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
