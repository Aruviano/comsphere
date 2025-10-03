import 'package:flutter/material.dart';

class Fitur3 extends StatelessWidget {
  const Fitur3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesan Tiket',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: const PesanTiketPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PesanTiketPage extends StatelessWidget {
  const PesanTiketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF3F4CC1),
          title: const Text(
            "Pesan Tiket",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/KAI_Logo.svg/2560px-KAI_Logo.svg.png",
                width: 50,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kereta Pergi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("19 Oktober 2025   •   17.20 - 18.00"),
                  SizedBox(height: 5),
                  Text(
                    "Yogyakarta  →  Jakarta",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Taksaka • Ekonomi"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Rincian Harga",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Taksaka (Dewasa x1)"),
                      Text(
                        "Ekonomi  Rp.80.000",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Biaya layanan Aplikasi"), Text("Rp0")],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (val) {},
                  activeColor: Colors.blue,
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Saya telah membaca dan setuju terhadap ",
                      children: [
                        TextSpan(
                          text: "Syarat dan ketentuan pembelian tiket",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3F4CC1),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "BAYAR",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "TAMBAH KE KERANJANG",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
