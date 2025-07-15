import 'package:first_flutter/Components/CustomButton.dart';
import 'package:first_flutter/LoginSection/HeaderSection.dart';
import 'package:first_flutter/Components/LabelledTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Bagian atas
              HeaderSection(
                isPortrait: isPotrait,
                screenWidth: screenWidth,
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

                    SizedBox(height: screenWidth * 0.03),

                    // Lupa kata sandi
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: TextStyle(
                            color: Color(0xFF647961),
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.05),

                    // Tombol Login
                    CustomButton(
                      isOutlined: false,
                      label: 'Login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
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
                            'atau',
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
                          "Belum punya akun?",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                          child: Text(
                            'Daftar',
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
