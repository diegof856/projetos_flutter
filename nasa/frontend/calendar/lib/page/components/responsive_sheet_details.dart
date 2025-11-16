import 'package:calendar/models/response_api.dart';
import 'package:calendar/page/components/list_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sheet/responsive_sheet.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

Future<void> openEventSheet(BuildContext context, ResponseApi event) async {
  await showResponsiveBottomSheet(
    context,
    styleBuilder: (context, type) {
      return ResponsiveSheetStyle(
        borderRadius: BorderRadius.circular(10),
        margin: 12,
      );
    },
    typeBuilder: (context) => ResponsiveSheetType.sheet,
    builder: (context, type) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(gradient: horizontalGradient()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                event.title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text("Date: ${formatDate(event.date)}", style: styleText()),
            const SizedBox(height: 10),
            Text("Description: ${event.description}", style: styleText()),
            const SizedBox(height: 10),
            Text("Hour: ${extractHourMinute(event.time)}", style: styleText()),
            const SizedBox(height: 10),
            Text("Status: ${event.status}", style: styleText()),
          ],
        ),
      );
    },
  );
}
String formatDate(String date){
   final dateTime = DateTime.parse(date);
   return DateFormat('dd/MM/yyyy').format(dateTime);
}