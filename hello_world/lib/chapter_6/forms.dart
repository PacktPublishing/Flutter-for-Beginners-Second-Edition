import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _controller = TextEditingController.fromValue(
    TextEditingValue(text: "Initial value"),
  );
  final _key = GlobalKey<FormFieldState<String>>();
  String _textValue = "";

  @override
  void initState() {
    _controller.addListener(() {
      this.setState(() {
        _textValue = _controller.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext topContext) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            validator: (String? value) {
              return value == null || value.isEmpty ? "Not empty" : null;
            },
          ),
          TextFormField(),
          Builder(
            builder: (BuildContext subContext) => TextButton(
              onPressed: () {
                final valid = Form.of(subContext)!.validate();
                print("valid: $valid");
              },
              child: Text("validate"),
            ),
          )
        ],
      ),
    );
  }
}
