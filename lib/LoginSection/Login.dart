import 'package:first_flutter/Components/CustomButton.dart';
import 'package:first_flutter/LoginSection/LoginHeader.dart';
import 'package:first_flutter/Components/LabelledTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:first_flutter/services/LoginAPI.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color(0xFF646452),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoginHeader(
                isPortrait: isPortrait,
                screenWidth: screenWidth,
              ),

              // Bagian bawah
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenWidth * 0.07,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Email
                      LabelledTextField(
                        label: 'Email',
                        screenWidth: screenWidth,
                        hintText: 'Masukkan email',
                        isPortrait: isPortrait,
                        obscureText: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenWidth * 0.05),

                      // Kata Sandi
                      LabelledTextField(
                        label: 'Kata Sandi',
                        screenWidth: screenWidth,
                        hintText: 'Masukkan kata sandi',
                        isPortrait: isPortrait,
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata sandi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenWidth * 0.03),

                      // Lupa Kata Sandi
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
                        onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final authService = AuthService();
                            final token = await authService.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (token != null) {
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login gagal. Cek email dan password.')),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Terjadi kesalahan: $e')),
                            );
                          }
                        }
                      }
                      ,
                        height:
                            isPortrait ? screenWidth * 0.13 : screenWidth * 0.09,
                        borderRadius: screenWidth * 0.03,
                        fontSize: screenWidth * 0.045,
                        backgroundColor: const Color(0xFF646452),
                      ),

                      SizedBox(height: screenWidth * 0.04),

                      // Divider
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                            ),
                            child: Text(
                              'atau',
                              style:
                                  TextStyle(fontSize: screenWidth * 0.035),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(height: screenWidth * 0.04),

                      // Masuk dengan Google
                      CustomButton(
                        isOutlined: true,
                        label: 'Masuk dengan Google',
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/devicon_google.svg',
                          height: screenWidth * 0.05,
                        ),
                        height:
                            isPortrait ? screenWidth * 0.13 : screenWidth * 0.09,
                        borderRadius: screenWidth * 0.03,
                        fontSize: screenWidth * 0.04,
                      ),

                      SizedBox(height: screenWidth * 0.03),

                      // Tautan ke halaman pendaftaran
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum punya akun?",
                            style:
                                TextStyle(fontSize: screenWidth * 0.035),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/register');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}