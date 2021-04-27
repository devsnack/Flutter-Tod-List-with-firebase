import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  var user = Firestore.instance.collection("board");

  final namectrl = TextEditingController();
  final hintctrl = TextEditingController();
  final descctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Todo-TASKS"),
      contentPadding: EdgeInsets.all(20),
      children: [
        TextField(
          onSubmitted: (value) {
            print(namectrl.text);
          },
          controller: namectrl,
          style: TextStyle(
            fontSize: 18,
          ),
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hoverColor: Color(0xffff6b81),
            fillColor: Color(0xffff6b81),
            focusColor: Color(0xffff6b81),
            labelText: 'Name',
            prefixIcon: Icon(Icons.people),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: hintctrl,
          style: TextStyle(
            fontSize: 18,
          ),
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hoverColor: Color(0xffff6b81),
            fillColor: Color(0xffff6b81),
            focusColor: Color(0xffff6b81),
            labelText: 'Hint',
            prefixIcon: Icon(Icons.add_alert),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: descctrl,
          style: TextStyle(
            fontSize: 20,
          ),
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hoverColor: Color(0xffff6b81),
            fillColor: Color(0xffff6b81),
            focusColor: Color(0xffff6b81),
            labelText: 'Description',
            prefixIcon: Icon(Icons.info),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
                onPressed: () {
                  return send(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Color(0xffff6b81), fontSize: 18),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "cancel",
                  style: TextStyle(color: Color(0xffff6b81), fontSize: 18),
                ))
          ],
        )
      ],
    );
  }

  //  start methods
  send(BuildContext context) {
    if (!namectrl.text.isEmpty &&
        !hintctrl.text.isEmpty &&
        !descctrl.text.isEmpty) {
      return user
          .add({
            'name': namectrl.text,
            'title': hintctrl.text,
            'todo': descctrl.text
          })
          .then((value) => {
                Navigator.of(context).pop(),
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("added succefully !"))),
              })
          .catchError((e) => print(e));
    }
  }
}
