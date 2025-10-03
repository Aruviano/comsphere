import 'package:comsphere/pages/fitur_3.dart';
import 'package:flutter/material.dart';

class Fitur2 extends StatefulWidget {
  const Fitur2({super.key});

  @override
  State<Fitur2> createState() => _Fitur2State();
}

class _Fitur2State extends State<Fitur2> {
  String? selectedTicket;

  // Data favorit (rute -> tanggal)
  final Map<String, String> favoriteTickets = {
    "Jakarta - Bandung": "28 November 2025",
    "Bandung - Semarang": "20 Desember 2025",
    "Solo - Semarang": "16 Oktober 2025",
  };

  final TextEditingController dateTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Rebooking Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Pesan Tiket Lebih Cepat Dengan Sekali Klik',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: dateTextField,
                      readOnly: true, // supaya user tidak perlu ketik manual
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: 'Tanggal otomatis terisi',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Pilih Riwayat Tiket Anda",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                      value:
                          (selectedTicket != null &&
                                  favoriteTickets.containsKey(selectedTicket))
                              ? selectedTicket
                              : null,
                      items:
                          favoriteTickets.entries.map((entry) {
                            return DropdownMenuItem<String>(
                              value: entry.key,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.key,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTicket = value;
                          dateTextField.text = favoriteTickets[value] ?? "";
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(flex: 2),
            SizedBox(
              width: 300,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  if (selectedTicket != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Tiket $selectedTicket (${favoriteTickets[selectedTicket]}) berhasil dipilih",
                        ),
                      ),
                    );
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fitur3()),
                  );
                },
                child: const Text('Pesan Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
