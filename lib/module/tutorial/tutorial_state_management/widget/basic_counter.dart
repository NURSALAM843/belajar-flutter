import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

class BasicCounter extends StatefulWidget {
  const BasicCounter({Key? key}) : super(key: key);

  @override
  State<BasicCounter> createState() => _BasicCounterState();
}

class _BasicCounterState extends State<BasicCounter> {
  int counter = 4;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(child: Text("$counter")),
          Expanded(
            child: ExButton(
              label: "Save",
              color: primaryColor,
              onPressed: () {
                counter++;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
