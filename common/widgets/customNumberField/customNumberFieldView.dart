import 'package:flutter/material.dart';
import 'package:yia/common/StateMonitor.dart';
import 'package:yia/common/widgets/customTextField/customTextFieldController.dart';

import '../../BaseClass.dart';

class CustomNumberField extends StatefulWidget {
  final String promptText;
  final TextStyle promptStyle, inputStyle;
  final TextEditingController textEditingController;

  const CustomNumberField(
      {this.promptText,
      this.promptStyle,
      this.inputStyle,
      this.textEditingController});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomNumberField>
    with View<CustomNumberField> {
  CustomTextFieldController customTextFieldController =
      new CustomTextFieldController();

  @override
  Widget getBody() {
    return Container(
      width: 65.0,
      child: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(50.0)),
            ),
            child: TextFormField(
              controller: widget.textEditingController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: widget.inputStyle,
              validator: (value) {
                // return FormFieldValidator.validateData(value, widget.promptText);
              },
              decoration: InputDecoration(
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
      ),
    );
  }

  @override
  Controller getController() {
    return customTextFieldController;
  }

  @override
  InstanceNames getName() {
    return InstanceNames.CustomNumberField;
  }
}
