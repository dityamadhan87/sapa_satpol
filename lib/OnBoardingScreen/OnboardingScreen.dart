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
      'image': 'assets/images/kartun_satpol.png',
    },
    {
      'title': 'Laporkan dengan Mudah 📲',
      'subtitle': 'Cukup beberapa langkah untuk melapor, tanpa ribet.',
      'image': 'assets/images/kartun_satpol.png',
    },
    {
      'title': 'Data Anda Aman 🔒',
      'subtitle': 'Kami jaga kerahasiaan data Anda dengan sepenuh hati.',
      'image': 'assets/images/kartun_satpol.png',
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
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final titleFontSizeBottom = height * 0.025; // misalnya 3% tinggi layar
    final subtitleFontSizeBottom = height * 0.02; // 2.5% tinggi layar
    final arrowIconSize = height * 0.04; // 4% tinggi layar

    final titleFontSize = height * 0.04;
    final imageHeight = height * 0.3;
    final dotSize = height * 0.012; // contoh: 1.2% tinggi layar

    final content = contentList[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFA0A08F),
      body: Column(
        children: [
          // Bagian atas
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SAPA SATPOL',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Image.asset(
                    content['image']!,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
          // Bagian bawah
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),   // atur radius sesuai selera
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    content['title']!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: titleFontSizeBottom,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    content['subtitle']!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: subtitleFontSizeBottom,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Row panah & indikator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: prevSlide,
                            icon: Icon(Icons.arrow_left, size: arrowIconSize),
                          ),
                          Row(
                            children: List.generate(
                              contentList.length,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                width: dotSize,
                                height: dotSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index
                                      ? Colors.black
                                      : Colors.grey[300],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: nextSlide,
                            icon: Icon(Icons.arrow_right, size: arrowIconSize),
                          ),
                        ],
                      ),
                      // Tombol Lewati
                      TextButton(
                        onPressed: () {
                          // Aksi lewati
                        },
                        child: Text(
                          'Lewati',
                          style: TextStyle(color: Colors.blue, fontSize: subtitleFontSizeBottom),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
