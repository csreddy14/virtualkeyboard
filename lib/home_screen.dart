import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamController<List<dynamic>> _csvStreamController = StreamController<List<dynamic>>();

  String text = '';

  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  late TextEditingController _controllerText;

  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
    _readCsv()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitual  Keyboard'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _controllerText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your text',
                  ),
                )),
            // SwitchListTile(
            //   title: Text(
            //     'Keyboard Type = ' +
            //         (isNumericMode
            //             ? 'VirtualKeyboardType.Numeric'
            //             : 'VirtualKeyboardType.Alphanumeric'),
            //   ),
            //   value: isNumericMode,
            //   onChanged: (val) {
            //     setState(() {
            //       isNumericMode = val;
            //     });
            //   },
            // ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.deepPurple,
              child: VirtualKeyboard(
                height: 300,
                textColor: Colors.white,
                type: isNumericMode
                    ? VirtualKeyboardType.Numeric
                    : VirtualKeyboardType.Alphanumeric,
                textController: _controllerText,
                defaultLayouts: [
                  VirtualKeyboardDefaultLayouts.English,
                  VirtualKeyboardDefaultLayouts.Arabic,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
