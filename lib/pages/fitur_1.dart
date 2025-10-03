import 'package:comsphere/pages/fitur_2.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class Fitur1 extends StatefulWidget {
  const Fitur1({super.key});

  @override
  State<Fitur1> createState() => _Fitur1State();
}

class _Fitur1State extends State<Fitur1> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Pesan Tiket'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fitur2()),
              );
            },
            icon: Icon(Icons.arrow_right_sharp),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
          ), // garis atas tipis
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Total Harga",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
                Text(
                  "Rp 45.000",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              onPressed: () {
                if (isChecked == true) {
                  AwesomeNotifications().createNotification(
                    content: NotificationContent(
                      id: DateTime.now().millisecondsSinceEpoch.remainder(
                        100000,
                      ),
                      channelKey: 'basic_channel',
                      title: 'Ayo Siap Siap',
                      body: 'Kereta Yang Akan Kamu Naikin Sudah Mau Tiba',
                      notificationLayout: NotificationLayout.Default,
                    ),
                  );
                  Future.delayed(Duration(seconds: 17), () {
                    AwesomeNotifications().createNotification(
                      content: NotificationContent(
                        id: DateTime.now().millisecondsSinceEpoch.remainder(
                          100000,
                        ),
                        channelKey: 'basic_channel',
                        title: 'Kereta Anda Ditunda',
                        body:
                            'Kereta Anda Sedang mengalami kendala selama 30 menit',
                        notificationLayout: NotificationLayout.Default,
                      ),
                    );
                  });
                }
              },
              child: Text(
                "LANJUTKAN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kereta Pergi'),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Kam, 02 Okt 2025'),
                        SizedBox(width: 9),
                        Text('●'),
                        SizedBox(width: 9),
                        Text('17:20 - 19:20'),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'Pasar Senen',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_right),
                        Text(
                          'Cikarang',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Spacer(flex: 1),
                        Icon(Icons.arrow_right_alt_outlined),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('1 Dewasa'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 17),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan Transportasi',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'pilih jenis layanan transportasi untuk \nperjalanan Anda',
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.circle),
                            SizedBox(height: 6),
                            Text('Taksi'),
                          ],
                        ),
                        SizedBox(width: 26),
                        Column(
                          children: [
                            Icon(Icons.circle),
                            SizedBox(height: 6),
                            Text('Bus'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.lightBlue,
                  value: isChecked,
                  onChanged: (bool? newvalue) async {
                    setState(() {
                      isChecked = newvalue ?? false;
                    });
                  },
                ),

                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Remind Me'),
                    Text(
                      '*Ingatkan saya jika kereta \nsudah dekat dengan saya',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
