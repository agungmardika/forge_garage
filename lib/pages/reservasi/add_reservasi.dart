// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:js';

// import 'package:crudsqf/helper/db_helper.dart';
// import 'package:crudsqf/pages/reservasi/edit_reservasi.dart';
// import 'package:flutter/material.dart';

// class addReservasiPage extends StatelessWidget {
//   addReservasiPage({super.key});
//   final DBHelper dbHelper = DBHelper();
//   final formKey = GlobalKey<FormState>();
//   final produk_servis = TextEditingController();
//   final tanggal_servis = TextEditingController();
//   final jam_servis = TextEditingController();
//   final tipe_mobil = TextEditingController();
//   List<Map<String, dynamic>> _reservasi = [];

//   @override
//   void _refreshReservasi() async {
//     final data = await dbHelper.queryAllUsers();
//     setState(() {
//       _reservasi = data;
//     });
//   }

//   void initState() {
//     super.initState();
//     _refreshReservasi();
//   }

//   Future<void> _addReservasi() async {
//     await dbHelper.insertReservasi({
//       'produk_servis': produk_servis.text,
//       'tanggal_servis': tanggal_servis.text,
//       'jam_servis': jam_servis.text,
//       'tipe_mobil': tipe_mobil.text,
//     });
//     _refreshReservasi();
//   }

//   Future<void> _updateReservasi(int id) async {
//     await dbHelper.updateReservasi({
//       'id': id,
//       'produk_servis': produk_servis.text,
//       'tanggal_servis': tanggal_servis.text,
//       'jam_servis': jam_servis.text,
//       'tipe_mobil': tipe_mobil.text,
//     });
//     _refreshReservasi();
//   }

//   void _deleteReservasi(int id) async {
//     await dbHelper.deleteReservasi(id);
//     ScaffoldMessenger.of(context as BuildContext)
//         .showSnackBar(const SnackBar(content: Text('Reservasi deleted')));
//     _refreshReservasi();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: Row(
//             children: [
//               SizedBox(
//                 width: 30,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 10),
//               ),
//               Text(
//                 "Add Reservasi",
//                 style: TextStyle(
//                   fontSize: 23,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           )),
//       body: ListView.builder(
//         itemCount: _reservasi.length,
//         itemBuilder: (context, index) => Card(
//           margin: const EdgeInsets.all(15),
//           child: ListTile(
//             title: Text(_reservasi[index]['produk_servis']),
//             subtitle: Text(_reservasi[index]['tanggal_servis']),
//             trailing: SizedBox(
//               width: 100,
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) =>
//                       //         editReservasiPage(_reservasi[index]['id']),
//                       //   ),
//                       // );
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () => _deleteReservasi(_reservasi[index]['id']),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
