import 'package:first_flutter/Components/CalenderField.dart';
import 'package:first_flutter/Components/CustomButton.dart';
import 'package:first_flutter/Components/LabeledDropdown.dart';
import 'package:first_flutter/Components/LabelledTextField.dart';
import 'package:first_flutter/Components/LocationField.dart';
import 'package:first_flutter/Components/TextAreaField.dart';
import 'package:first_flutter/LaporanSection/KransosSection/BuildIconBox.dart';
import 'package:flutter/material.dart';
// import package untuk location, camera, gallery kalau mau implementasi lanjut

class KransosFormPage extends StatefulWidget {
  const KransosFormPage({super.key});

  @override
  State<KransosFormPage> createState() => _KransosFormPageState();
}

class _KransosFormPageState extends State<KransosFormPage> {
  final _formKey = GlobalKey<FormState>();

  String? _lokasi;
  String? _personil;
  DateTime _selectedDate = DateTime.now();
  String? _jenisKransos;
  String? _deskripsi;
  String? _jenisTindakan;
  int? _jumlahPelanggar;
  String? _keteranganTambahan;
  String? _dokumentasi;

  final _personilOptions = ['Personil A', 'Personil B', 'Personil C'];
  final _jenisKransosOptions = ['Jenis 1', 'Jenis 2', 'Jenis 3'];

  final _notesController = TextEditingController();
  final _jenisTindakanController = TextEditingController();
  final _jumlahPelanggarController = TextEditingController();
  final _keteranganTambahanController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    _jenisTindakanController.dispose();
    _jumlahPelanggarController.dispose();
    _keteranganTambahanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: (isPotrait ? screenWidth * 0.2 : screenWidth * 0.13),
        title: Text(
          "Kransos",
          style: TextStyle(
            fontSize: (isPotrait ? screenWidth * 0.06 : screenWidth * 0.045),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF7D7D66),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: screenWidth * 0.06,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenWidth * 0.05,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Lokasi
                LocationField(
                  onLocationSelected: (value) {
                    setState(() {
                      _lokasi = '${value.latitude}, ${value.longitude}';
                    });
                  },
                ),

                SizedBox(height: screenWidth * 0.05),

                // Personil (dropdown)
                DropdownButtonFormField<String>(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.015,
                    vertical: screenWidth * 0.01,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: RichText(
                      text: TextSpan(
                        text: 'Personil',
                        style: TextStyle(
                          fontSize: isPotrait ? screenWidth * 0.045 : screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  hint: Text('Pilih personil'),
                  style: TextStyle(
                    fontSize: (isPotrait ? screenWidth * 0.04 : screenWidth * 0.025),
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  items: _personilOptions
                    .map(
                      (p) => DropdownMenuItem(
                        value: p,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                          child: Text(p),
                        ),
                      ),
                    )
                    .toList(),
                  value: _personil,
                  onChanged: (val) => setState(() => _personil = val),
                  validator: (val) => val == null ? 'Pilih personil' : null,
                  onSaved: (val) => _personil = val,
                ),

                SizedBox(height: screenWidth * 0.05),

                // Tanggal
                CalendarField(
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),

                SizedBox(height: screenWidth * 0.05),

                // Jenis Kransos (dropdown)
                DropdownButtonFormField<String>(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.015,
                    vertical: screenWidth * 0.01,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: RichText(
                      text: TextSpan(
                        text: 'Jenis Kransos',
                        style: TextStyle(
                          fontSize: isPotrait ? screenWidth * 0.045 : screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  hint: Text('Pilih jenis kransos'),
                  style: TextStyle(
                    fontSize: (isPotrait ? screenWidth * 0.04 : screenWidth * 0.025),
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  items: _jenisKransosOptions.map(
                    (j) => DropdownMenuItem(
                          value: j,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.01,
                            ),
                            child: Text(j),
                          ),
                        ),
                      )
                      .toList(),
                  value: _jenisKransos,
                  onChanged: (val) => setState(() => _jenisKransos = val),
                  validator: (val) => val == null ? 'Pilih jenis kransos' : null,
                  onSaved: (val) => _jenisKransos = val,
                ),

                SizedBox(height: screenWidth * 0.05),

                // Deskripsi
                TextAreaField(
                  label: 'Deskripsi Pelanggaran',
                  controller: _notesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenWidth * 0.05),

                // Jenis Tindakan
                LabelledTextField(
                  label: 'Jenis Tindakan', 
                  controller: _jenisTindakanController,
                  screenWidth: screenWidth, 
                  hintText: 'Jenis Tindakan', 
                  isPortrait: isPotrait, 
                  obscureText: false,
                ),

                SizedBox(height: screenWidth * 0.05),

                //Jumlah Pelanggar
                LabelledTextField(
                  label: 'Jumlah Pelanggar',
                  controller: _jumlahPelanggarController,
                  screenWidth: screenWidth,
                  hintText: 'Jumlah Pelanggar',
                  isPortrait: isPotrait,
                  obscureText: false,
                ),

                SizedBox(height: screenWidth * 0.05),

                // Keterangan Tambahan
                LabelledTextField(
                  label: 'Keterangan Tambahan',
                  controller: _keteranganTambahanController,
                  screenWidth: screenWidth,
                  hintText: 'Keterangan Tambahan',
                  isPortrait: isPotrait,
                  obscureText: false,
                ),

                SizedBox(height: screenWidth * 0.05),

                // Dokumentasi
                Text('Dokumentasi',
                  style: TextStyle(
                    fontSize: (isPotrait ? screenWidth * 0.04 : screenWidth * 0.03),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BuildIconBox(
                      icon: Icons.camera_alt,
                      label: 'Kamera',
                      size: (isPotrait ? screenWidth * 0.15 : screenWidth * 0.1),
                      color: Color(0xFF7D7D66),
                      onTap: () {
                        // TODO: Tambahkan aksi kamera
                        print("Buka kamera");
                      },
                      screenWidth: screenWidth,
                      isPortrait: isPotrait,
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    BuildIconBox(
                      icon: Icons.photo,
                      label: 'Galeri',
                      size: (isPotrait ? screenWidth * 0.15 : screenWidth * 0.1),
                      color: Color(0xFF7D7D66),
                      onTap: () {
                        // TODO: Tambahkan aksi galeri
                        print("Buka galeri");
                      },
                      screenWidth: screenWidth,
                      isPortrait: isPotrait,
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.1),
                // Tombol Submit
                CustomButton(
                  isOutlined: false,
                  label: 'Buat Laporan',
                  onPressed: () {
                  },
                  height: isPotrait ? screenWidth * 0.13 : screenWidth * 0.09,
                  borderRadius: screenWidth * 0.03,
                  fontSize: screenWidth * 0.045,
                  backgroundColor: const Color(0xFF7D7D66),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
