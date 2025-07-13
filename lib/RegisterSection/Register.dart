import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double buttonHeight(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final orientation = MediaQuery.of(context).orientation;

      double h;
      if (orientation == Orientation.portrait) {
        h = size.height * 0.065;
        if (h < 48) h = 48;
      } else {
        h = size.height * 0.13;
      }

      return h;
    }

    double googleIconHeight(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final orientation = MediaQuery.of(context).orientation;

      if (orientation == Orientation.portrait) {
        double h = size.height * 0.03; // misalnya
        if (h < 24) h = 24; // minimal
        return h;
      } else {
        return 32; // landscape → tetap lebih besar
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas
            Container(
              width: double.infinity,
              color: const Color(0xFF646452),
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo_sapa_satpol.svg',
                    width: screenWidth * 0.2,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Buat akun baru Anda sekarang!",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Bagian bawah
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.05),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NIK
                  Text.rich(
                    TextSpan(
                      text: 'NIK',
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukkan NIK',
                      hintStyle: TextStyle(fontSize: screenWidth * 0.035),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Email
                  Text.rich(
                    TextSpan(
                      text: 'Email',
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Masukkan email',
                      hintStyle: TextStyle(fontSize: screenWidth * 0.035),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Kata Sandi
                  Text.rich(
                    TextSpan(
                      text: 'Kata Sandi',
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Masukkan kata sandi',
                      hintStyle: TextStyle(fontSize: screenWidth * 0.035),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Konfirmasi Kata Sandi
                  Text.rich(
                    TextSpan(
                      text: 'Konfirmasi Kata Sandi',
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi kata sandi',
                      hintStyle: TextStyle(fontSize: screenWidth * 0.035),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.04,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Tombol Daftar
                  SizedBox(
                    width: double.infinity,
                    height: buttonHeight(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF646452),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Text(
                          'atau',
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  SizedBox(
                    width: double.infinity,
                    height: buttonHeight(context),
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/devicon_google.svg',
                        height: googleIconHeight(context),
                      ),
                      label: Text(
                        'Daftar dengan Google',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun?",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // balik ke login
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: screenWidth * 0.038,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}