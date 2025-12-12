import 'package:flutter/material.dart';

class Step2DataKampus extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final String jurusan;
  final Function(String) onJurusanChanged;

  final int semester;
  final Function(double) onSemesterChanged;

  final List<String> hobi;
  final Function(String) onHobiChanged;

  final bool setuju;
  final Function(bool) onSetujuChanged;

  const Step2DataKampus({
    super.key,
    required this.formKey,
    required this.jurusan,
    required this.onJurusanChanged,
    required this.semester,
    required this.onSemesterChanged,
    required this.hobi,
    required this.onHobiChanged,
    required this.setuju,
    required this.onSetujuChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            value: jurusan,
            decoration: InputDecoration(
              labelText: "Jurusan",
              prefixIcon: Icon(Icons.school),
            ),
            items: [
              'Informatika',
              'Sistem Informasi',
              'Teknik Elektro',
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => onJurusanChanged(v!),
          ),
          SizedBox(height: 20),
          Text("Semester: $semester",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Slider(
            value: semester.toDouble(),
            min: 1,
            max: 8,
            divisions: 7,
            label: semester.toString(),
            onChanged: onSemesterChanged,
          ),
          SizedBox(height: 10),
          Text("Hobi:", style: TextStyle(fontWeight: FontWeight.bold)),
          CheckboxListTile(
            title: Text("Ngoding"),
            value: hobi.contains("Ngoding"),
            onChanged: (v) => onHobiChanged("Ngoding"),
          ),
          CheckboxListTile(
            title: Text("Gaming"),
            value: hobi.contains("Gaming"),
            onChanged: (v) => onHobiChanged("Gaming"),
          ),
          SizedBox(height: 10),
          SwitchListTile(
            title: Text("Setuju dengan ketentuan"),
            value: setuju,
            onChanged: onSetujuChanged,
          ),
        ],
      ),
    );
  }
}
