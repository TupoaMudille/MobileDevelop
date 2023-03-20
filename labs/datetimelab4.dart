import 'dart:async';
import 'package:flutter/material.dart';

class DateTimeLab4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DatePicker',
      home: Page(title: 'DatePicker'),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page> createState() => _State();
}

class _State extends State<Page> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      print(selectedDate);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      print(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("$selectedDate"),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            Text('$selectedTime'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Select time'),
            ),
          ],
        ),
      ),
    );
  }
}
