Nama: Farah Tsani Maulida

NIM: H1D023095

Shift D -> Shift F


# Tugas Pertemuan 6

## PROSES PASSING DATA DARI FORM MENUJU TAMPILAN
Proses pengiriman data berjalan melalui 3 tahap utama: 
1. User mengetik data di Form (menggunakan TextField + TextEditingController) 
2. Data diambil dari controller ketika tombol "Simpan" ditekan
3. Data dikirim ke halaman lain (TampilData) melalui constructor dan Navigator.push()

Rincian Penjelasan:

**Pada Form**: 
1. Input Data Menggunakan TextEditingController
   Di form membuat 3 controller:
   ```
   final _namaController = TextEditingController();
   final _nimController = TextEditingController();
   final _tahunLahirController = TextEditingController();
   ```
   Digunakan untuk: menyimpan apa yang ditulis user pada TextField dan memberikan akses untuk mengambil teksnya nanti.
   
   Masing-masing controller kemudian dipasang atau dimasukkan ke TextField:
   ```
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
   ```
   Jadi, setiap kali user mengetik, isi controller otomatis berubah.

2. Menangkap Data Saat Tombol “Simpan” Ditekan
   Ketika tombol ditekan:
   ```
   onPressed: () {
   String nama = _namaController.text;
   String nim = _nimController.text;
   int tahunLahir = int.parse(_tahunLahirController.text);
   ```
   Yang terjadi, yaitu mengambil teks dari TextField:

   - nama berisi teks dari input nama
   - nim berisi teks dari input nim
   - tahunLahir diubah dari string menjadi angka (int.parse)
   
   Data ini sekarang siap dikirim ke halaman berikutnya.
  
4. Mengirim Data ke Halaman TampilData
   Data dikirim ke Halaman TampilData menggunakan <ins>navigator.push</ins>:
   ```
   Navigator.of(context).push(MaterialPageRoute(
       builder: (context) => TampilData(
         nama: nama,
         nim: nim,
         tahunLahir: tahunLahir,
       ),
      ),
   );
   ```
   Pada baris ini, kita membuat halaman baru TampilData dan langsung mengirim nilai:

   - nama: nama
   - nim: nim
   - tahunLahir: tahunLahir
  
   Semua itu dikirim melalui constructor dari TampilData.


   **Pada Tampilan:**
6.   Menerima Data di Halaman TampilData
     Di halaman ini, sudah menyediakan parameter:
     ```
     final String nama;
     final String nim;
     final int tahunLahir;
     ```
     Di sinilah tempat Flutter menyimpan data yang diterima dari halaman sebelumnya.

     Constructor menerima data tersebut:
     ```
     const TampilData({
     super.key,
     required this.nama,
     required this.nim,
     required this.tahunLahir,
     });
     ```
     Jadi, nilai yang dikirim dari Form langsung masuk ke variabel ini.
    
8.  Menampilkan Data
    Di dalam build():
    
    `int umur = DateTime.now().year - tahunLahir;`

    Melakukan perhitungan umur berdasarkan tahun sekarang.

    Kemudian menampilkan:
    
    `Text(
          'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun',
        ),`

### Demo Aplikasi:
https://github.com/user-attachments/assets/62777ff1-f5cb-4dc9-961b-dfc47825091b 

### Screenshots:
<img src="https://github.com/user-attachments/assets/bddfe67e-e86d-419f-9331-cdcbe6aed6a6" width="300">
<img src="https://github.com/user-attachments/assets/2626a3d2-75d3-4494-ba1a-e64a2e3240ea" width="300">
