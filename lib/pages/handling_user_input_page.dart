import 'package:flutter/material.dart';
import 'package:learn_app/helper/string_helper.dart';

enum Calendar { day, week, month, year }

class HandlingUserInputPage extends StatefulWidget {
  const HandlingUserInputPage({super.key});

  @override
  State<HandlingUserInputPage> createState() => _HandlingUserInputPageState();
}

class _HandlingUserInputPageState extends State<HandlingUserInputPage> {
  final _globalKey = GlobalKey<FormState>();
  Calendar calendar = Calendar.day;
  double _sliderValue = 0.0;
  final List<String> _animals = <String>[
    "koala",
    "monkey",
    "leopard",
    "elephant",
    "rhiNo",
  ];
  String? _initAnimal = "koala";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Handling User Input')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Unselectable text?'),
            const SizedBox(height: 10),
            // selectable text
            SelectableText('''
      Two households, both alike in dignity,
      In fair Verona, where we lay our scene,
      From ancient grudge break to new mutiny,
      Where civil blood makes civil hands unclean.
      From forth the fatal loins of these two foes
      '''),
            const SizedBox(height: 10),
            // richtext
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Normal',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(text: ' world!'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // textfield with form and textfiledform
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  // provide textfiled for input
                  TextField(),
                  const SizedBox(height: 10),
                  // textformfield = textfield + validator + onSaved
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter something";
                      }
                      return "";
                    },
                    onSaved: (newValue) {},
                  ),
                ],
              ),
            ),
            // segemented button
            SegmentedButton(
              segments: const <ButtonSegment<Calendar>>[
                ButtonSegment<Calendar>(
                  value: Calendar.day,
                  label: Text('Day'),
                  icon: Icon(Icons.calendar_view_day),
                ),
                ButtonSegment<Calendar>(
                  value: Calendar.week,
                  label: Text('Week'),
                  icon: Icon(Icons.calendar_view_week),
                ),
                ButtonSegment<Calendar>(
                  value: Calendar.month,
                  label: Text('Month'),
                  icon: Icon(Icons.calendar_view_month),
                ),
                ButtonSegment<Calendar>(
                  value: Calendar.year,
                  label: Text('Year'),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
              selected: <Calendar>{calendar},
              onSelectionChanged: (Set<Calendar> newSelection) {
                setState(() {
                  calendar = newSelection.first;
                });
              },
            ),
            // slider
            Slider(
              value: _sliderValue,
              divisions: 5,
              max: 5,
              label: _sliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            // dropdown text
            DropdownButton<String>(
              value: _initAnimal,
              items: _animals.map((animal) {
                return DropdownMenuItem<String>(
                  value: animal,
                  child: Text(animal.capitalize()),
                );
              }).toList(),
              onChanged: (String? animal) {
                setState(() {
                  _initAnimal = animal;
                });
              },
            ),
            // checkbox,chips are somwwhat similar to drppdown button using intial state and changing them
          ],
        ),
      ),
    );
  }
}
