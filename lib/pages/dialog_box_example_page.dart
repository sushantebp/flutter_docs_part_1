import 'package:flutter/material.dart';

class DialogBoxExamplePage extends StatefulWidget {
  const DialogBoxExamplePage({super.key});

  @override
  State<DialogBoxExamplePage> createState() => _DialogBoxExamplePageState();
}

class _DialogBoxExamplePageState extends State<DialogBoxExamplePage> {
  DateTime? dateTime;

  Future<void> _selectDateTime() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
    if (pickedDate != null) {
      setState(() {
        dateTime = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Box Examples"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // showdatepicker example
            Text(
              dateTime == null
                  ? "No date selected"
                  : "Selected date: ${dateTime!.toLocal().toString().split(' ')[0]}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: const Text(
                "Select Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              onPressed: _selectDateTime,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
