// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, camel_case_types, prefer_final_fields

import 'package:crudsqf/helper/db_helper.dart';
import 'package:crudsqf/pages/reservasi/detail_reservasi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class formReservasi extends StatefulWidget {
  const formReservasi({super.key});

  @override
  State<formReservasi> createState() => _formReservasiState();
}

class _formReservasiState extends State<formReservasi> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _produkServisController = TextEditingController();
  TextEditingController _tanggalServisController = TextEditingController();
  TextEditingController _jamServisController = TextEditingController();
  TextEditingController _tipeMobilController = TextEditingController();

  InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: Colors.white,
  );

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

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      final data = {
        'produk_servis': _produkServisController.text,
        'tanggal_servis': _tanggalServisController.text,
        'jam_servis': _jamServisController.text,
        'tipe_mobil': _tipeMobilController.text,
      };

      final int newReservasiId = await DBHelper().insertReservasi(data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reservasi berhasil disimpan')),
      );

      _produkServisController.clear();
      _tanggalServisController.clear();
      _jamServisController.clear();
      _tipeMobilController.clear();

      // Navigasi ke halaman pesananPage dengan menggunakan ID yang baru saja didapatkan
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pesananPage(id: newReservasiId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Reservasi'),
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
                  icon: Icon(Icons.calendar_today),
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
                  icon: Icon(Icons.access_time),
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
              onPressed: _submitForm,
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
