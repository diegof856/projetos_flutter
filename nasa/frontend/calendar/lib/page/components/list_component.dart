import "package:calendar/colors/color.dart";
import "package:calendar/models/response_api.dart";
import "package:calendar/page/calendar_page.dart";
import "package:calendar/page/components/responsive_sheet_details.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

Widget eventsList(List<ResponseApi> events) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return _eventItem(context,event);
          },
        ),
    );
    
  }

Widget _eventItem(BuildContext context, ResponseApi event){
return GestureDetector(
  onTap: () =>openEventSheet(context, event),
  child: Row(
    children: [
    _pointBlue(),
      SizedBox(width: 16),
      _dayNumeric(DateTime.parse(event.date)),
        SizedBox(width: 16),
       Expanded(child: _infoBasics(event))
    ],
  ),
);
}
Widget _infoBasics(ResponseApi event){
  return Container(
     padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    decoration: _blueBox(),
    child: Row(
        children: [
            _infoColumn(event)
        ],
      ),
  ) ;
  
}
Widget _infoColumn(ResponseApi event){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(event.title,
       style: textStyle(),
       ),
      _infoRow(extractHourMinute(event.time), event.status)
    ],
  );
 
}
Widget _infoRow(String hour, String closed){
  return Row(
     children: [
      Text(hour,
       style: styleText()
      ),
     SizedBox(width: 28),
      Text("Closed:"+closed,
      style: styleText(), 
      )
     ],
  );
}
List<BoxShadow> _createShadowBlue() {
    return [
      BoxShadow(
        color: ColorsCustom.colorShadow,
        offset: const Offset(-7, 9),
        blurRadius: 1,
      ),
    ];
  }

 BoxDecoration _blueBox(){
  return BoxDecoration(
      gradient: horizontalGradient(),
    borderRadius: BorderRadius.circular(10),
    boxShadow: _createShadowBlue()
    );
 }

LinearGradient horizontalGradient(){
  return LinearGradient(
    begin: Alignment.centerLeft,
     end: Alignment.centerRight,
    colors:[ColorsCustom.colorHorizontalGradBegin,ColorsCustom.colorHorizontalGradEnd]);
}
 String extractHourMinute(String timeString) {
  try {
    
    if (timeString.contains(':')) {
      final parts = timeString.split(':');
      if (parts.length >= 2) {
        return '${parts[0]}:${parts[1]}'; 
      }
    }
    return '--:--';
  } catch (e) {
    print('Erro ao extrair hora: $timeString');
    return '--:--';
  }
}


Widget _dayNumeric(DateTime eventDatete){
  return Column(
    children: [
        Text(eventDatete.day.toString(),style:textStyle()),
      
        Text(DateFormat.E('en_US').format(eventDatete).substring(0, 3).toUpperCase(),style: textStyle())
    ],
  );
}
TextStyle styleText(){
  
  return const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
}

Widget _pointBlue() {
  return Container(
    width: 12, 
    height: 12, 
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: buildGradient()
    )
  );
}

