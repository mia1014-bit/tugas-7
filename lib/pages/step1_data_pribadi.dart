import 'package:flutter/material.dart';

class Step1DataPribadi extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController namaC;
  final TextEditingController emailC;
  final TextEditingController hpC;

  const Step1DataPribadi({
    super.key,
    required this.formKey,
    required this.namaC,
    required this.emailC,
    required this.hpC,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: namaC,
            decoration: InputDecoration(
              labelText: 'Nama',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (v) => v!.isEmpty ? 'Nama wajib diisi' : null,
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: emailC,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (v) {
              if (v!.isEmpty) return 'Email wajib diisi';
              if (!v.contains('@')) return 'Format email salah';
              return null;
            },
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: hpC,
            decoration: InputDecoration(
              labelText: 'Nomor HP',
              prefixIcon: Icon(Icons.phone),
            ),
            validator: (v) {
              if (v!.isEmpty) return 'Nomor HP wajib diisi';
              if (double.tryParse(v) == null)
                return 'Nomor HP harus angka';
              return null;
            },
          ),
        ],
      ),
    );
  }
}
