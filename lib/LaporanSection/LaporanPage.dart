import 'package:first_flutter/LaporanSection/FullWidthButton.dart';
import 'package:first_flutter/LaporanSection/MenuItem.dart';
import 'package:flutter/material.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  String activeMenu = 'Pengajuan Laporan';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.2,
        title: Text(
          "Laporan",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF7D7D66),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.08,
            screenHeight * 0.04,
            screenWidth * 0.08,
            screenHeight * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenWidth * 0.03),

              // === Menu Navigasi Atas ===
              Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                decoration: BoxDecoration(
                  color: const Color(0xFFECECE8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuItem(
                      icon: Icons.note_add,
                      label: 'Pengajuan\nLaporan',
                      isActive: activeMenu == 'Pengajuan Laporan',
                      onTap: () {
                        setState(() {
                          activeMenu = 'Pengajuan Laporan';
                        });
                      },
                    ),
                    MenuItem(
                      icon: Icons.inbox,
                      label: 'Laporan\nMasuk',
                      isActive: activeMenu == 'Laporan Masuk',
                      onTap: () {
                        setState(() {
                          activeMenu = 'Laporan Masuk';
                        });
                      },
                    ),
                    MenuItem(
                      icon: Icons.history,
                      label: 'Riwayat\nLaporan',
                      isActive: activeMenu == 'Riwayat Laporan',
                      onTap: () {
                        setState(() {
                          activeMenu = 'Riwayat Laporan';
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenWidth * 0.02),

              // === Konten Dinamis ===
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (activeMenu) {
      case 'Pengajuan Laporan':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FullWidthButton(label: 'Kransos'),
            FullWidthButton(label: 'Pamwal'),
            FullWidthButton(label: 'Pengamanan'),
            FullWidthButton(label: 'Perizinan'),
            FullWidthButton(label: 'Piket'),
            FullWidthButton(label: 'PKL'),
            FullWidthButton(label: 'Reklame'),
          ],
        );
      case 'Laporan Masuk':
        return const Center(
          child: Text(
            'Ini adalah halaman Laporan Masuk',
            style: TextStyle(fontSize: 18),
          ),
        );
      case 'Riwayat Laporan':
        return const Center(
          child: Text(
            'Ini adalah halaman Riwayat Laporan',
            style: TextStyle(fontSize: 18),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}