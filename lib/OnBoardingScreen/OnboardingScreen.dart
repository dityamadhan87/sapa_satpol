import 'package:first_flutter/OnBoardingScreen/OnBoardingContent.dart';
import 'package:first_flutter/OnBoardingScreen/OnBoardingHeader.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> contentList = [
    {
      'title': 'Halo Sobat Tertib, Selamat Datang di SAPA SATPOL! 🤝✨',
      'subtitle':
          'Platform resmi yang memudahkan pelaporan pelanggaran di Kota Batu secara cepat dan aman.',
    },
    {
      'title': 'Laporkan dengan Mudah 📲',
      'subtitle': 'Cukup beberapa langkah untuk melapor, tanpa ribet.',
    },
    {
      'title': 'Data Anda Aman 🔒',
      'subtitle': 'Kami jaga kerahasiaan data Anda dengan sepenuh hati.',
    },
  ];

  void nextSlide() {
    setState(() {
      if (currentIndex < contentList.length - 1) {
        currentIndex++;
      }
    });
  }

  void prevSlide() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFA0A08F),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bagian atas 
              OnBoardingHeader(),

              // Bagian bawah
              OnBoardingContent(
                title: contentList[currentIndex]['title']!,
                subtitle: contentList[currentIndex]['subtitle']!,
                currentIndex: currentIndex,
                total: contentList.length,
                onNext: nextSlide,
                onPrev: prevSlide,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
