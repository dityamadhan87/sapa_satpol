import 'package:first_flutter/Components/CustomButton.dart';
import 'package:first_flutter/Components/LabelledTextField.dart';
import 'package:first_flutter/RegisterSection/RegisterSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color(0xFF646452),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bagian atas
              RegisterSection(
                isPortrait: isPotrait,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),

              // Bagian bawah
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenWidth * 0.07,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Nama Lengkap
                    LabelledTextField(
                      label: 'Nama Lengkap',
                      screenWidth: screenWidth,
                      hintText: 'Masukkan nama lengkap',
                      isPortrait: isPotrait,
                      obscureText: false,
                    ),

                    SizedBox(height: screenWidth * 0.05),

                    // Email
                    LabelledTextField(
                      label: 'Email',
                      screenWidth: screenWidth,
                      hintText: 'Masukkan email',
                      isPortrait: isPotrait,
                      obscureText: false,
                    ),

                    SizedBox(height: screenWidth * 0.05),

                    // Kata Sandi
                    LabelledTextField(
                      label: 'Kata Sandi',
                      screenWidth: screenWidth,
                      hintText: 'Masukkan kata sandi',
                      isPortrait: isPotrait,
                      obscureText: true,
                    ),

                    SizedBox(height: screenWidth * 0.05),

                    // Konfirmasi Kata Sandi
                    LabelledTextField(
                      label: 'Konfirmasi Kata Sandi',
                      screenWidth: screenWidth,
                      hintText: 'Masukkan konfirmasi kata sandi',
                      isPortrait: isPotrait,
                      obscureText: true,
                    ),

                    SizedBox(height: screenWidth * 0.05),

                    // Tombol Daftar
                    CustomButton(
                      isOutlined: false,
                      label: 'Daftar',
                      onPressed: () {},
                      height: isPotrait ? screenWidth * 0.13 : screenWidth * 0.09,
                      borderRadius: screenWidth * 0.03,
                      fontSize: screenWidth * 0.045,
                      backgroundColor: const Color(0xFF646452),
                    ),

                    SizedBox(height: screenWidth * 0.03),

                    // Atau dengan Google
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Text(
                            'Daftar dengan',
                            style: TextStyle(fontSize: screenWidth * 0.035),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),

                    SizedBox(height: screenWidth * 0.03),

                    // Tombol Masuk dengan Google
                    CustomButton(
                      isOutlined: true,
                      label: 'Masuk dengan Google',
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/devicon_google.svg',
                        height: screenWidth * 0.05,
                      ),
                      height: isPotrait ? screenWidth * 0.13 : screenWidth * 0.09,
                      borderRadius: screenWidth * 0.03,
                      fontSize: screenWidth * 0.04,
                    ),

                    SizedBox(height: screenWidth * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
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
      ),
    );
  }
}