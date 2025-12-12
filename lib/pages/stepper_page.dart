import 'package:flutter/material.dart';
import 'step1_data_pribadi.dart';
import 'step2_data_kampus.dart';
import 'step3_konfirmasi.dart';

class StepperPage extends StatefulWidget {
  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController hpC = TextEditingController();

  String jurusan = "Informatika";
  int semester = 1;
  List<String> hobi = [];
  bool setuju = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Mahasiswa Validasi",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 2,
      ),
      body: Stepper(
        elevation: 2,
        margin: EdgeInsets.all(16),
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep == 0 && formKey1.currentState!.validate()) {
            setState(() => currentStep = 1);
          } else if (currentStep == 1 &&
              formKey2.currentState!.validate() &&
              setuju) {
            setState(() => currentStep = 2);
          }
        },
        onStepCancel: () {
          if (currentStep > 0) setState(() => currentStep--);
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Lanjut"),
                ),
                SizedBox(width: 12),
                if (currentStep > 0)
                  OutlinedButton(
                    onPressed: details.onStepCancel,
                    style: OutlinedButton.styleFrom(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Kembali"),
                  )
              ],
            ),
          );
        },
        steps: [
          Step(
            isActive: currentStep == 0,
            title: Text("Data Pribadi"),
            content: Card(
              elevation: 3,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black12,
              margin: EdgeInsets.only(top: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Step1DataPribadi(
                  formKey: formKey1,
                  namaC: namaC,
                  emailC: emailC,
                  hpC: hpC,
                ),
              ),
            ),
          ),
          Step(
            isActive: currentStep == 1,
            title: Text("Data Kampus"),
            content: Card(
              elevation: 3,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              shadowColor: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Step2DataKampus(
                  formKey: formKey2,
                  jurusan: jurusan,
                  onJurusanChanged: (v) => setState(() => jurusan = v),
                  semester: semester,
                  onSemesterChanged: (v) =>
                      setState(() => semester = v.toInt()),
                  hobi: hobi,
                  onHobiChanged: (v) {
                    setState(() {
                      hobi.contains(v) ? hobi.remove(v) : hobi.add(v);
                    });
                  },
                  setuju: setuju,
                  onSetujuChanged: (v) => setState(() => setuju = v),
                ),
              ),
            ),
          ),
          Step(
            isActive: currentStep == 2,
            title: Text("Konfirmasi"),
            content: Card(
              elevation: 3,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Step3Konfirmasi(
                  nama: namaC.text,
                  email: emailC.text,
                  hp: hpC.text,
                  jurusan: jurusan,
                  semester: semester,
                  hobi: hobi,
                  setuju: setuju,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
