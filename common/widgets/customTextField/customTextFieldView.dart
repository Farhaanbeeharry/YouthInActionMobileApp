import 'package:flutter/material.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldController.dart';

import '../../BaseClass.dart';

class CustomTextField extends StatefulWidget {
  final String promptText;
  final TextStyle promptStyle, inputStyle;
  final TextEditingController textEditingController;

  const CustomTextField(
      {this.promptText,
      this.promptStyle,
      this.inputStyle,
      this.textEditingController});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with View<CustomTextField> {
  CustomTextFieldController customTextFieldController =
      new CustomTextFieldController();

  @override
  Widget getBody() {
    return Column(
      children: [
        Container(
          height: 40.0,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(50.0)),
          ),
          child: TextFormField(
            controller: widget.textEditingController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            style: widget.inputStyle,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                contentPadding: EdgeInsets.only(left: 25),
                border: new OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                labelText: widget.promptText,
                labelStyle: widget.promptStyle),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  @override
  Controller getController() {
    return customTextFieldController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.CustomTextField;
  }
}
