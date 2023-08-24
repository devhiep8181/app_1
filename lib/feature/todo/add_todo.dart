import 'package:intl/intl.dart';

import 'content.dart';
import 'package:flutter/material.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  List<ContentToDo> listToDo = [];

  int edittingIndex = -1;
  //edittingIndex: theo dõi vị trí đối tượng đang được chỉnh sửa
  //flow: ấn vào nút edit -> gọi hàm editElement() -> gán giá trị eddittingIndex = index
  // -> giá trị sẽ được gán cho TextFormField -> gọi hàm _saveElement lưu đối tượng -> clear

  TextEditingController _textTitle = TextEditingController();
  TextEditingController _dateEditingController = TextEditingController();

  DateTime selectedTime = DateTime.now();
  final DateFormat _dateFormat = DateFormat("dd-MM-yyyy");
  bool hasSelectedDate = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedTime,
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        hasSelectedDate = true;
        _dateEditingController.text = _dateFormat.format(selectedTime);
      });
    }
  }

//add
  void addElement() {
    String title = _textTitle.text;
    ContentToDo todo = ContentToDo(title: title, dateTime: selectedTime);
    setState(() {
      listToDo.add(todo);
      _textTitle.clear();
      _dateEditingController.clear();
    });
  }

//edit
  void _editElement(int index) {
    setState(() {
      edittingIndex = index; //vị trí hiện tại đang chỉnh sửa
      _textTitle.text = listToDo[index].title;
      selectedTime = listToDo[index].dateTime;
    });
  }

//save
  void _saveElement() {
    if (edittingIndex >= 0 && edittingIndex < listToDo.length) {
      String updateTitle = _textTitle.text;
      ContentToDo updateTodo =
          ContentToDo(title: updateTitle, dateTime: selectedTime);
      setState(() {
        listToDo[edittingIndex] = updateTodo;
        edittingIndex = -1; //thoát trạng thái chỉnh sửa
        _textTitle.clear();
        _dateEditingController.clear();
      });
    }
  }

//remove
  void _removeElement(int index) {
    setState(() {
      listToDo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add To Do"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            edittingIndex >= 0 ? _saveElement() : addElement();
          },
          child: Icon(Icons.check),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _textTitle,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
              TextFormField(
                controller: _dateEditingController,
                onTap: () {
                  _selectDate(context);
                },
                readOnly:
                    true, //dam bao nguoi dung chi co the chon ngay bang cach cham vao TextFormField
                decoration: InputDecoration(
                  hintText: "Date",
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                  child: ListView.builder(
                itemCount: listToDo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listToDo[index].title),
                    subtitle:
                        Text(_dateFormat.format(listToDo[index].dateTime)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              _editElement(index);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              _removeElement(index);
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
