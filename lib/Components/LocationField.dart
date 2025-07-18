import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class LocationField extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const LocationField({super.key, required this.onLocationSelected});

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  LatLng? selectedLocation;
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  Future<void> _fetchAddressFromCoordinates(LatLng latLng) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=${latLng.latitude}&lon=${latLng.longitude}&addressdetails=1',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'KransosApp/1.0 (edogawaradit@gmail.com)',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final displayName = data['display_name'];
        setState(() {
          _alamatController.text = displayName ?? 'Alamat tidak ditemukan';
        });
      } else {
        setState(() {
          _alamatController.text = 'Gagal mengambil alamat';
        });
      }
    } catch (e) {
      setState(() {
        _alamatController.text = 'Terjadi kesalahan';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Pilih Lokasi',
            style: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.045 : screenWidth * 0.03),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBox(
          height: (isPortrait ? screenWidth * 0.4 : screenWidth * 0.3),
          child: FlutterMap(
            options: MapOptions(
              initialCenter: selectedLocation ?? LatLng(-7.870874, 112.526777), 
              initialZoom: 13,
              onTap: (tapPos, latlng) async {
                setState(() {
                  selectedLocation = latlng;
                  _latController.text = latlng.latitude.toStringAsFixed(6);
                  _lngController.text = latlng.longitude.toStringAsFixed(6);
                });
                widget.onLocationSelected(latlng);
                await _fetchAddressFromCoordinates(latlng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                tileProvider: NetworkTileProvider(
                  headers: {
                    'User-Agent': 'KransosApp/1.0 (sss@gmail.com)',
                  },
                ),
              ),
              if (selectedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: selectedLocation!,
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      child: Icon(Icons.location_on, color: Colors.red, size: (isPortrait ? screenWidth * 0.1 : screenWidth * 0.05)),
                    ),
                  ],
                ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        TextField(
          controller: _alamatController,
          readOnly: false,
          decoration: InputDecoration(
            labelText: 'Alamat (Bisa manual atau otomatis)',
            labelStyle: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.045 : screenWidth * 0.03),
              color: Colors.black,
            ),
            hintText: 'Alamat akan muncul di sini...',
            hintStyle: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.04 : screenWidth * 0.025),
              color: Colors.grey,
            ),
          ),
          style: TextStyle(
            fontSize: (isPortrait ? screenWidth * 0.04 : screenWidth * 0.025),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}