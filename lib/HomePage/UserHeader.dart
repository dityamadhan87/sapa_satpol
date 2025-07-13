import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String nama;
  final String ajakan;
  final VoidCallback onNotificationTap;

  const UserHeader({
    super.key,
    required this.nama,
    required this.ajakan,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        CircleAvatar(
          radius: screenWidth * 0.07,
          backgroundImage: const AssetImage(
            'assets/images/kartun_satpol.png',
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        // Teks
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $nama',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                ajakan,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ],
          ),
        ),
        // Icon Notifikasi
        IconButton(
          onPressed: onNotificationTap,
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
            size: screenWidth * 0.07,
          ),
        ),
      ],
    );
  }
}
