Event Planner
-Fitur Utama : Login & Logout, Tambah acara dan simpan secara lokal dan Menu pengaturan untuk Dark Mode.

Penjelasan Penting Bagian Kode :
1. main.dart
File ini adalah entry point aplikasi. Aplikasi memulai dari sini dan mendefinisikan rute (routes) serta pengaturan tema (Light Mode/Dark Mode)

2. login_page.dart
   onPressed: () {
  if (usernameController.text == 'user' && passwordController.text == 'password') {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('loggedIn', true);  // Simpan status login
    });
    Navigator.pushReplacementNamed(context, '/events');  // Arahkan ke halaman daftar acara
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Username atau Password salah')),
    );
  }
},

Ini adalah halaman login yang memungkinkan pengguna untuk memasukkan username dan password. Saat login berhasil, status login disimpan di SharedPreferences.

3. event_list_page.dart
Future<void> loadEvents() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? storedData = prefs.getStringList('events');  // Ambil data acara dari SharedPreferences
  if (storedData != null) {
    setState(() {
      events = storedData.map((item) {
        var data = item.split(',');
        return Event(title: data[0], date: data[1], time: data[2]);  // Ubah data jadi objek Event
      }).toList();
    });
  }
}

Halaman ini menampilkan daftar acara yang disimpan secara lokal. Pengguna dapat menambah acara baru melalui tombol FloatingActionButton.

4. add_event_page.dart
onPressed: () {
  if (titleController.text.isNotEmpty && dateController.text.isNotEmpty && timeController.text.isNotEmpty) {
    Event newEvent = Event(
      title: titleController.text,
      date: dateController.text,
      time: timeController.text,
    );
    Navigator.pop(context, newEvent);  // Kembalikan data acara baru ke halaman daftar acara
  }
},

Halaman untuk menambahkan acara baru. Setelah pengguna menambahkan acara, data tersebut disimpan di SharedPreferences dan ditampilkan di halaman daftar acara.

5. event_model.dart
  class Event {
  String title;
  String date;
  String time;

  Event({required this.title, required this.date, required this.time});
}

Model data untuk acara, yang mencakup atribut title, date, dan time.

6. settings_page.dart
   ListTile(
  title: Text('Dark Mode'),
  trailing: Switch(
    value: isDarkMode,
    onChanged: (bool value) {
      onThemeChange();  // Panggil fungsi untuk mengubah tema
    },
  ),
),

Halaman pengaturan yang menyediakan opsi untuk mengubah tema aplikasi (Light Mode/Dark Mode).

7. logout_page.dart
   ElevatedButton(
  onPressed: () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');  // Menghapus status login
    Navigator.pushReplacementNamed(context, '/');  // Arahkan kembali ke halaman login
  },
  child: Text('Ya, Logout'),
),

Halaman logout yang menampilkan konfirmasi kepada pengguna sebelum melakukan logout.

Tampilan Screenshot App:
1. Tampilan login : ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(101).png)
2. Tampilan Dashboard : ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(102).png)
3. Tampilan Tambah Event: ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(103).png)
4. Tampilan Setting: ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(104).png)
5. Tampilan Event: ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(105).png)
6. Tampilan Logout: ![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(106).png)
![Alt Text](https://github.com/yosijulia31/LapMobile3_YosiJuliaUtami_D/blob/main/screenshoot/Screenshot%20(107).png)
