// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'feature/todo/content.dart'; // Import thư viện intl

// class MyTodoScreen extends StatefulWidget {
//   @override
//   _MyTodoScreenState createState() => _MyTodoScreenState();
// }

// class _MyTodoScreenState extends State<MyTodoScreen> {
//   final TextEditingController _textFieldController = TextEditingController();
//   DateTime selectedDate = DateTime.now();
//   final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
//   List<ContentToDo> todos = [];
//   int editingIndex = -1;

//   void _addTodo() {
//     String userInput = _textFieldController.text;
//     ContentToDo newTodo = ContentToDo(title: userInput, dateTime: selectedDate);

//     setState(() {
//       todos.add(newTodo);
//       _textFieldController.clear();
//     });
//   }

//   void _editTodo(int index) {
//     setState(() {
//       editingIndex = index;
//       _textFieldController.text = todos[index].title;
//       selectedDate = todos[index].dateTime;
//     });
//   }

//   void _saveEditedTodo() {
//     if (editingIndex >= 0 && editingIndex < todos.length) {
//       String updatedTitle = _textFieldController.text;
//       ContentToDo updatedTodo =
//           ContentToDo(title: updatedTitle, dateTime: selectedDate);

//       setState(() {
//         todos[editingIndex] = updatedTodo;
//         editingIndex = -1;
//         _textFieldController.clear();
//       });
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List Example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: _textFieldController,
//             decoration: InputDecoration(
//               labelText: 'Enter task title',
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Text('Selected Date: ${_dateFormat.format(selectedDate)}'),
//               ElevatedButton(
//                 onPressed: () => _selectDate(context),
//                 child: Text('Select Date'),
//               ),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: editingIndex >= 0 ? _saveEditedTodo : _addTodo,
//             child: Text(editingIndex >= 0 ? 'Save Edit' : 'Add Todo'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(todos[index].title),
//                   subtitle: Text(
//                       'Date: ${_dateFormat.format(todos[index].dateTime)}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () => _editTodo(index),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
