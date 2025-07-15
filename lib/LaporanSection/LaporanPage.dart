import 'package:first_flutter/LaporanSection/FullWidthButton.dart';
import 'package:first_flutter/LaporanSection/MenuDimension.dart';
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
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final dimensions = MenuDimensions(screenWidth, isPotrait);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: (isPotrait ? screenWidth * 0.2 : screenWidth * 0.13),
        title: Text(
          "Laporan",
          style: TextStyle(
            fontSize: (isPotrait ? screenWidth * 0.06 : screenWidth * 0.045),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF7D7D66),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenWidth * 0.03),

              // === Menu Navigasi Atas ===
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: (isPotrait
                      ? screenWidth * 0.03
                      : screenWidth * 0.03),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFECECE8),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: SizedBox(
                  height: dimensions.sizedBoxHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuItem(
                        dimensions: dimensions,
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
                        dimensions: dimensions,
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
                        dimensions: dimensions,
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
              ),

              SizedBox(height: screenWidth * 0.04),

              // === Konten Dinamis ===
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    switch (activeMenu) {
      case 'Pengajuan Laporan':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: screenWidth * 0.04,
          children: [
            FullWidthButton(
              label: 'Kransos',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'Pamwal',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'Pengamanan',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'Perizinan',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'Piket',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'PKL',
              onTap: () {
              },
            ),
            FullWidthButton(
              label: 'Reklame',
              onTap: () {
              },
            ),
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
