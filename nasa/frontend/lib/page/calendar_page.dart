import 'package:calendar/colors/color.dart';
import 'package:calendar/models/response_api.dart';
import 'package:calendar/page/components/list_component.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  final Future<List<ResponseApi>> Function() response;
  const CalendarPage({required this.response, super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  
  List<ResponseApi> allEvents = [];
  List<ResponseApi> eventsOfTheMonth = [];
  List<ResponseApi> eventsOfTheDay = [];
  bool loading = true;
  late DateTime focusedDay;
  DateTime? selectedDay;
  @override
  void initState() {
    super.initState();

    widget.response().then((list) {
      setState(() {
        allEvents = list;
        focusedDay = DateTime.parse(allEvents.first.date);
        eventsOfTheMonth = _filterEventsByMonth(focusedDay);
        eventsOfTheDay = [];
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _linearGradientColor(
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : _bodyCalendar(),
    );
  }

  Widget _bodyCalendar() {
    final DateTime firstEventDate = DateTime.parse(allEvents[0].date);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          _calendar(firstEventDate),
          _textEvents(),
          Expanded(
            child: eventsList(
              selectedDay != null ? eventsOfTheDay : eventsOfTheMonth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _calendar(DateTime firstEventDate) {
    return TableCalendar(
      firstDay: DateTime(firstEventDate.year - 1),
      lastDay: DateTime(firstEventDate.year + 1),
      focusedDay: focusedDay,

      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      onDaySelected: (selecDay, focDay) {
        final hasEvents = _filterEventsByDay(selecDay).isNotEmpty;
        setState(() {
          //  Clicou de novo no mesmo dia → limpar seleção
          if (isSameDay(selectedDay, selecDay)) {
            selectedDay = null;
            eventsOfTheDay = [];
            return;
          }
          // Clicou em dia sem eventos → limpar seleção
          if (!hasEvents) {
            selectedDay = null;
            eventsOfTheDay = [];
            return;
          }
          // Clicou em um dia válido → selecionar e filtrar
          selectedDay = selecDay;
          focusedDay = focDay;
          eventsOfTheDay = _filterEventsByDay(selecDay);
        });
      },
      onPageChanged: (newFocusedDay) {
        setState(() {
          focusedDay = newFocusedDay;
          selectedDay = null;
          eventsOfTheMonth = _filterEventsByMonth(newFocusedDay);
          eventsOfTheDay = [];
        });
      },
      daysOfWeekStyle: DaysOfWeekStyle(
        decoration: BoxDecoration(color: ColorsCustom.colorBannerDays),
        dowTextFormatter: (date, locale) {
          return DateFormat.E(
            locale,
          ).format(date).substring(0, 1).toUpperCase();
        },
        weekdayStyle: textStyle(),
        weekendStyle: textStyle(),
      ),
      calendarStyle: CalendarStyle(
        weekendTextStyle: textStyle(),
        outsideDaysVisible: false,
        defaultTextStyle: textStyle(),
        selectedDecoration: BoxDecoration(
           color: ColorsCustom.colorPrimary500,      
          shape: BoxShape.circle,
        )
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: textStyle(),
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 64,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 64,
        ),
        titleCentered: true,
        titleTextFormatter: (date, locale) {
          final monthName = DateFormat.MMM(locale).format(date);
          final year = date.year;
          return "Hello, Gabriel\n$monthName $year";
        },
      ),
      daysOfWeekHeight: 31,
    );
  }

  List<ResponseApi> _filterEventsByMonth(DateTime focusedDay) {
    return allEvents.where((event) {
      final d = DateTime.parse(event.date);
      return d.year == focusedDay.year && d.month == focusedDay.month;
    }).toList();
  }

  List<ResponseApi> _filterEventsByDay(DateTime date) {
    return allEvents.where((event) {
      final d = DateTime.parse(event.date);
      return d.year == date.year && d.month == date.month && d.day == date.day;
    }).toList();
  }
}

TextStyle textStyle() {
  return const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
}

Widget _textEvents() {
  return Container(
    height: 31,
    decoration: BoxDecoration(color: ColorsCustom.colorBannerDays),
    child: Center(
      child: Text("Weather events listed this month", style: textStyle()),
    ),
  );
}

Widget _linearGradientColor({required Widget child}) {
  return Container(
    decoration: BoxDecoration(gradient: buildGradient()),
    child: child,
  );
}

LinearGradient buildGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorsCustom.colorPrincipalTopCenter,
      ColorsCustom.colorPrincipalBottomCenter,
    ],
  );
}
