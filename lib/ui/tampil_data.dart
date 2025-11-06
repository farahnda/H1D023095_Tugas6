import 'package:flutter/material.dart';

class TampilData extends StatelessWidget{
  final String nama;
  final String nim;
  final int tahunLahir;
  const TampilData({
    super.key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
    });
    
  @override
  Widget build(BuildContext context) {
    int umur = DateTime.now().year - tahunLahir;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun',
        ),
      ),
    );
  }
}
