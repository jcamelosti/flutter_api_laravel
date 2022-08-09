import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  late String textString;
  late String yourParam;
  late Function(String) onSelectParam;

  TextInput(this.textString,
      this.onSelectParam, {Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(

        hintText: this.textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
