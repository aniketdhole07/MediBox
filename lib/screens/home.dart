import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/medi.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widgets/medi_card.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Home extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Home({
    Key key,
    this.auth,
    this.firestore,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Reminder\n" + widget.auth.currentUser.uid),
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Auth(auth: widget.auth).signOut();
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Add Medicine Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Medicine Name',
                      ),
                      controller: _textController,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Medicine BOX Name (Eg. A,B,C)'),
                      controller: _textController2,
                    )),
                    Flexible(
                        child: TextFormField(
                      decoration: InputDecoration(labelText: 'Doses Number'),
                      controller: _textController3,
                    ))
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                        child: DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyyy',
                      controller: _controller2,
                      //initialValue: _initialValue,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                    )),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        if (_textController.text.isNotEmpty &&
                            _textController2.text.isNotEmpty &&
                            _textController3.text.isNotEmpty &&
                            _controller2.text.isNotEmpty) {
                          setState(() {
                            Database(firestore: widget.firestore).addMed(
                                uid: widget.auth.currentUser.uid,
                                content: _textController.text.trim(),
                                box: _textController2.text.trim(),
                                date: _controller2.text.trim(),
                                dose: _textController3.text.trim());
                            _textController.clear();
                            _textController2.clear();
                            _textController3.clear();
                            _controller2.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your Schedule",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: Database(firestore: widget.firestore)
                .streamMeds(uid: widget.auth.currentUser.uid),
            builder:
                (BuildContext context, AsyncSnapshot<List<Medi>> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data.isEmpty) {
                  return const Center(
                    child: Text("You dont have any Medicine Schedule"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return MediCard(
                      firestore: widget.firestore,
                      uid: widget.auth.currentUser.uid,
                      medi: snapshot.data[index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Loading..."),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
