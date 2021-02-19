import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/medi.dart';
import '../services/database.dart';

class MediCard extends StatefulWidget {
  final Medi medi;
  final FirebaseFirestore firestore;
  final String uid;

  const MediCard({
    Key key,
    this.medi,
    this.firestore,
    this.uid,
  }) : super(key: key);

  @override
  _MediCardState createState() => _MediCardState();
}

class _MediCardState extends State<MediCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.medi.content + "     Box:" + widget.medi.box,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Date:" + widget.medi.date + "     Dose:" + widget.medi.dose,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: widget.medi.done,
              onChanged: (newVal) {
                setState(() {});
                Database(firestore: widget.firestore).updateMed(
                  uid: widget.uid,
                  id: widget.medi.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
