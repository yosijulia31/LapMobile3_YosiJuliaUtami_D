class Event {
  String title;
  String date;
  String time;

  Event({required this.title, required this.date, required this.time});

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'time': time,
      };

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      date: json['date'],
      time: json['time'],
    );
  }
}
