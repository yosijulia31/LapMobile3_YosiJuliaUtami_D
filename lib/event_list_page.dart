import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event_model.dart';
import 'settings_page.dart';
import 'logout_page.dart';  // Import halaman logout

class EventListPage extends StatefulWidget {
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedData = prefs.getStringList('events');
    if (storedData != null) {
      setState(() {
        events = storedData.map((item) {
          var data = item.split(',');
          return Event(title: data[0], date: data[1], time: data[2]);
        }).toList();
      });
    }
  }

  Future<void> saveEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedData = events.map((event) => '${event.title},${event.date},${event.time}').toList();
    await prefs.setStringList('events', storedData);
  }

  void addEvent(Event event) {
    setState(() {
      events.add(event);
    });
    saveEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Acara')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('Tambah Acara'), onTap: () {
              Navigator.pushNamed(context, '/addEvent').then((result) {
                if (result != null) {
                  addEvent(result as Event);
                }
              });
            }),
            ListTile(title: Text('Pengaturan'), onTap: () {
              Navigator.pushNamed(context, '/settings');
            }),
            ListTile(title: Text('Logout'), onTap: () {
              Navigator.pushNamed(context, '/logout'); // Arahkan ke halaman logout
            }),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index].title),
            subtitle: Text('${events[index].date} - ${events[index].time}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addEvent').then((result) {
            if (result != null) {
              addEvent(result as Event);
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
