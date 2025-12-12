import 'package:flutter/material.dart';

class Step3Konfirmasi extends StatelessWidget {
  final String nama;
  final String email;
  final String hp;
  final String jurusan;
  final int semester;
  final List<String> hobi;
  final bool setuju;

  const Step3Konfirmasi({
    super.key,
    required this.nama,
    required this.email,
    required this.hp,
    required this.jurusan,
    required this.semester,
    required this.hobi,
    required this.setuju,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Konfirmasi Data",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Divider(height: 24),
        Text("Nama: $nama"),
        Text("Email: $email"),
        Text("Nomor HP: $hp"),
        Text("Jurusan: $jurusan"),
        Text("Semester: $semester"),
        Text("Hobi: ${hobi.join(', ')}"),
        SizedBox(height: 20),
        ElevatedButton.icon(
          icon: Icon(Icons.check_circle),
          label: Text("Selesai"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pendaftaran Berhasil!")),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}
