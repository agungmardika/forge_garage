import 'package:crudsqf/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class editReservasiPage extends StatefulWidget {
  final List<Map<String, dynamic>> reservasi; // Parameter reservasi
  final int id; // Tambahkan parameter id
  const editReservasiPage({Key? key, required this.reservasi, required this.id})
      : super(key: key);

  @override
  State<editReservasiPage> createState() => _editReservasiPageState();
}

class _editReservasiPageState extends State<editReservasiPage> {
  final DBHelper dbHelper = DBHelper();
  final formKey = GlobalKey<FormState>();

  late TextEditingController _produkServisController;
  late TextEditingController _tanggalServisController;
  late TextEditingController _jamServisController;
  late TextEditingController _tipeMobilController;

  InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    if (widget.reservasi.isNotEmpty) {
      _produkServisController =
          TextEditingController(text: widget.reservasi[0]["produk_servis"]);
      _tanggalServisController =
          TextEditingController(text: widget.reservasi[0]["tanggal_servis"]);
      _jamServisController =
          TextEditingController(text: widget.reservasi[0]["jam_servis"]);
      _tipeMobilController =
          TextEditingController(text: widget.reservasi[0]["tipe_mobil"]);
    } else {
      _produkServisController = TextEditingController();
      _tanggalServisController = TextEditingController();
      _jamServisController = TextEditingController();
      _tipeMobilController = TextEditingController();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _tanggalServisController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _jamServisController.text = picked.format(context);
      });
    }
  }

  Future<void> _updateReservasi() async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> updatedReservasi = {
        'id': widget.reservasi[0]['id'],
        'produk_servis': _produkServisController.text,
        'tanggal_servis': _tanggalServisController.text,
        'jam_servis': _jamServisController.text,
        'tipe_mobil': _tipeMobilController.text,
      };

      // Update the reservation in the database
      int rowsUpdated = await dbHelper.updateReservasi(updatedReservasi);
      print("Rows updated: $rowsUpdated"); // Debugging log

      // If the update was successful, navigate back and pass true as the result
      if (rowsUpdated > 0) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Reservasi"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            const Text(
              "Produk Service",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _produkServisController,
              decoration: decoration.copyWith(
                hintText: "Input Produk Service",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Produk service tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            const Text(
              "Tanggal Service",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _tanggalServisController,
              onTap: () => _selectDate(context),
              readOnly: true,
              decoration: decoration.copyWith(
                hintText: "Input Tanggal Service",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tanggal service tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            const Text(
              "Jam Service",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _jamServisController,
              readOnly: true,
              onTap: () => _selectTime(context),
              decoration: decoration.copyWith(
                hintText: "Input Jam Service",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () => _selectTime(context),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Jam service tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            const Text(
              "Tipe Mobil",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _tipeMobilController,
              decoration: decoration.copyWith(
                hintText: "Input Tipe Mobil",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tipe mobil tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _updateReservasi,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D3557),
                fixedSize: const Size(700, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(15.0),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
