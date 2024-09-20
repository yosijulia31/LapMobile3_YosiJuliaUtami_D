import 'package:flutter/material.dart';
import 'event_model.dart';

class AddEventPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Acara')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Judul Acara')),
            TextField(controller: dateController, decoration: InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)')),
            TextField(controller: timeController, decoration: InputDecoration(labelText: 'Waktu (HH:MM)')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Event newEvent = Event(
                  title: titleController.text,
                  date: dateController.text,
                  time: timeController.text,
                );
                Navigator.pop(context, newEvent); // Mengembalikan objek Event
              },
              child: Text('Simpan Acara'),
            ),
          ],
        ),
      ),
    );
  }
}
