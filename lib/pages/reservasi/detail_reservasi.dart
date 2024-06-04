import 'package:crudsqf/helper/db_helper.dart';
import 'package:crudsqf/pages/reservasi/edit_reservasi.dart';
import 'package:flutter/material.dart';

class pesananPage extends StatefulWidget {
  final int id; // Tambahkan parameter id jika diperlukan

  const pesananPage({Key? key, required this.id}) : super(key: key);

  @override
  State<pesananPage> createState() => _pesananPageState();
}

class _pesananPageState extends State<pesananPage> {
  final DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> _reservasi = [];

  @override
  void initState() {
    super.initState();
    _refreshReservasi();
  }

  void _refreshReservasi() async {
    final data = await dbHelper.queryAllReservasi();
    setState(() {
      _reservasi = data;
    });
  }

  void _deleteReservasi(int id) async {
    await dbHelper.deleteReservasi(id);
    _refreshReservasi();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reservasi Berhasil dihapus'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
        centerTitle: true,
      ),
      body: ListView(
        children: _reservasi.map(
          (data) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("Produk Servis", data['produk_servis'] ?? ''),
                  _buildInfoRow(
                      "Tanggal Servis",
                      data['tanggal_servis'] != null
                          ? data['tanggal_servis'].toString()
                          : ''),
                  _buildInfoRow(
                      "Jam Servis",
                      data['jam_servis'] != null
                          ? data['jam_servis'].toString()
                          : ''),
                  _buildInfoRow("Tipe Mobil", data['tipe_mobil'] ?? ''),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditReservasiPage(
                                  id: data['id'], // Mengirim id yang terpilih
                                  reservasi: [], // Pastikan reservasi sesuai dengan data yang ingin diubah
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Edit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _deleteReservasi(data['id']);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Ubah radius sesuai kebutuhan
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Delete",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
