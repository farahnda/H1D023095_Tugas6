import 'package:flutter/material.dart';
import 'package:h1d023095_tugas6/ui/tampil_data.dart';


class FormData extends StatefulWidget {
  const FormData({super.key});
  @override
  _formDataState createState() => _formDataState();
}

class _formDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _textboxNama(),
            _textboxNim(),
            _textboxTahunLahir(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Nama'),
      controller: _namaController,
    );
  }

  _textboxNim() {
    return TextField(
      decoration: const InputDecoration(labelText: 'NIM'),
      controller: _nimController,
    );
  }

  _textboxTahunLahir() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Tahun Lahir'),
      controller: _tahunLahirController,
      keyboardType: TextInputType.number,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahunLahir = int.parse(_tahunLahirController.text);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TampilData(
              nama: nama,
              nim: nim,
              tahunLahir: tahunLahir,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }

}