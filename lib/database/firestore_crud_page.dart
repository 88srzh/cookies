import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  _FirestoreCRUDPageState createState() => _FirestoreCRUDPageState();
}

class _FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  String id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: createData,
                child: Text(
                  'Создать',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text(
                  'Read',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Введите текст';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref =
          await db.collection('CRUD').add({'name': '$name '});
      setState(() => id = ref.id);
      print(ref.id);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('CRUD').doc(id).get();
    print(snapshot.data);
  }

  // void updateData(DocumentSnapshot doc) async {
  //   await db.collection('CRUD').document(doc.documentID).updateData({'todo': 'please '});
  // }

}
