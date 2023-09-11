import 'package:app_1/ui_components/btn/btn_default.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<String> _labelList = [
    "Email",
    "PassWord",
    "Address",
    "Age",
    "Name",
    "Birthday",
    "Athentical",
    "Hihi",
    "Haha",
    "Hehe"
  ];
  final List<FocusNode> _focusNode = List.generate(10, (index) => FocusNode());
  final List<TextEditingController> _textEdditingList =
      List.generate(10, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _focusNode.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextFormField(
                    controller: _textEdditingList[index],
                    focusNode: _focusNode[index],
                    onFieldSubmitted: (value) {
                      if (index < _focusNode.length - 1) {
                        _focusNode[index + 1].requestFocus();
                      }
                    },
                    decoration: InputDecoration(
                        labelText: _labelList[index],
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1.0, color: Color(0xffBEBAB3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const BtnDefault(
            title: "OK",
          )
        ],
      ),
    );
  }
}
