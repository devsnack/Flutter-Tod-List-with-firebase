import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/ui/updatetask.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  var data;
  Cart({this.data});

  @override
  Widget build(BuildContext context) {
    var user = Firestore.instance.collection("board");

    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(data.documentID),
      background: Container(
        padding: EdgeInsets.only(right: 20),
        color: Color(0xffff6b81),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      onDismissed: (direction) {
        user.document(data.documentID).delete();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Deleted Succefully !",
            style: TextStyle(color: Color(0xffff6b81)),
          ),
          duration: Duration(seconds: 1),
        ));
      },
      child: Card(
        elevation: 10,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffff6b81),
              child: Text(
                data["name"].toString()[0].toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Update(data: data);
                      });
                }),
            title: Text(
              data["title"].toString(),
              style: TextStyle(),
            ),
            subtitle: Text(data["todo"].toString()),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
