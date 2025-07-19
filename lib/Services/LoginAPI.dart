import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://31a1d68179f6.ngrok-free.app/api';

  Future<String?> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email_masyarakat': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      print('Login failed: ${response.body}');
      return null;
    }
  }

  Future<bool> register(String email, String password, String nama) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nama_masyarakat': nama,
        'email_masyarakat': email,
        'password': password,
      }),
    );

    return response.statusCode == 200;
  }
}


