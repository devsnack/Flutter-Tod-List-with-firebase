import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/ui/card.dart';

import 'addtask.dart';

class Screen extends StatelessWidget {
  var user = Firestore.instance.collection("board");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Note keeper 🍑"),
          backgroundColor: Color(0xffff6b81),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffff6b81),
            child: Icon(Icons.add),
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Add();
                  });
            }),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: StreamBuilder(
            stream: user.snapshots(),
            builder: (BuildContext context, snapshot) {
              //    return Text(snapshot.data.documents[0]["name"].toString());
              if (!snapshot.hasData)
                return CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                );
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(snapshot.data.documents[0].documentID);
                    return Cart(
                      data: snapshot.data.documents[index],
                    );
                  });
            },
          ),
        ));
  }
}
