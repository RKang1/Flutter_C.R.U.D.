//See below for more details
//https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html#0

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrud/input.dart';
import 'package:fluttercrud/input_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController inputController = new TextEditingController();
  final CollectionReference database = Firestore.instance.collection('inputs');

  _saveInput() {
//    print("_saveTransaction() executed");
    Map<String, dynamic> data = {'Text': inputController.text};
    database.add(data);
  }

  Widget _buildInputList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('inputs').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return Flexible(
          child: Container(
            color: Colors.grey,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: snapshot.data.documents.map((data) {
                Input inputItem = Input.fromSnapshot(data);
                return Padding(
                  padding: EdgeInsets.all(5.0),
                  key: ValueKey(inputItem.reference),
                  child: InputTile(
                    input: inputItem,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Form(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    controller: inputController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Text Input',
                    ),
                  ),
                ),
              ),
              _buildInputList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _saveInput();
          },
        ),
      ),
    );
  }
}
