import 'package:first_flutter/Components/CustomButton.dart';
import 'package:first_flutter/Components/LabelledTextField.dart';
import 'package:first_flutter/RegisterSection/LoadingOverlay.dart';
import 'package:first_flutter/RegisterSection/RegisterHeader.dart';
import 'package:first_flutter/RegisterSection/SuccessfulOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  bool _isSuccessful = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF646452),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Bagian atas
                  RegisterHeader(
                    isPortrait: isPortrait,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama Lengkap
                          LabelledTextField(
                            label: 'Nama Lengkap',
                            screenWidth: screenWidth,
                            hintText: 'Masukkan nama lengkap',
                            isPortrait: isPortrait,
                            obscureText: false,
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: screenWidth * 0.05),

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
                              final emailRegex = RegExp(
                                r'^[\w\.-]+@[\w\.-]+\.\w+$',
                              );
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
                              } else if (value.length < 8) {
                                return 'Kata sandi minimal 8 karakter';
                              } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                return 'Harus ada huruf kapital';
                              } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                                return 'Harus ada huruf kecil';
                              } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                                return 'Harus ada angka';
                              } else if (!RegExp(r'[^\w\s]').hasMatch(value)) {
                                return 'Harus ada karakter spesial';
                              }
                              return null;
                            },
                            infoText:
                                "Kata sandi minimal 8 karakter, harus ada huruf kapital, huruf kecil, angka, dan karakter spesial.",
                          ),

                          SizedBox(height: screenWidth * 0.05),

                          // Konfirmasi Kata Sandi
                          LabelledTextField(
                            label: 'Konfirmasi Kata Sandi',
                            screenWidth: screenWidth,
                            hintText: 'Masukkan konfirmasi kata sandi',
                            isPortrait: isPortrait,
                            obscureText: true,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Konfirmasi kata sandi tidak cocok';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: screenWidth * 0.05),

                          // Tombol Daftar
                          CustomButton(
                            isOutlined: false,
                            label: 'Daftar',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                await Future.delayed(const Duration(seconds: 5));

                                setState(() {
                                  _isLoading = false;
                                });

                                setState(() {
                                  _isSuccessful = true;
                                });
                              }
                            },
                            height: isPortrait
                                ? screenWidth * 0.13
                                : screenWidth * 0.09,
                            borderRadius: screenWidth * 0.03,
                            fontSize: screenWidth * 0.045,
                            backgroundColor: const Color(0xFF646452),
                          ),

                          SizedBox(height: screenWidth * 0.05),

                          // Divider
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                ),
                                child: Text(
                                  'Daftar dengan',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),

                          SizedBox(height: screenWidth * 0.05),

                          // Tombol Masuk dengan Google
                          CustomButton(
                            isOutlined: true,
                            label: 'Masuk dengan Google',
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/devicon_google.svg',
                              height: screenWidth * 0.05,
                            ),
                            height: isPortrait
                                ? screenWidth * 0.13
                                : screenWidth * 0.09,
                            borderRadius: screenWidth * 0.03,
                            fontSize: screenWidth * 0.04,
                          ),

                          SizedBox(height: screenWidth * 0.03),

                          // Navigasi ke login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sudah punya akun?",
                                style: TextStyle(fontSize: screenWidth * 0.035),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
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
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading) const LoadingOverlay(),
        if (_isSuccessful) const SuccessfulOverlay(),
      ],
    );
  }
}
