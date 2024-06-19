import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:hotel/view/auth/login_screen.dart';
import 'package:hotel/view/auth/categories.dart';

class HttpService {
  static final _client = http.Client();

  static final _loginUrl = Uri.parse('http://192.168.100.45:5001/login');
  static final _registerUrl = Uri.parse('http://192.168.100.45:5001/register');

  static Future<void> login(
      String username, String pass, BuildContext context) async {
    try {
      final response = await _client.post(
        _loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'uname': username, 'passw': pass}),
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          json['status'] == 'Inicio sesión con éxito') {
        await EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MultipleSelectionGrid()),
        );
      } else {
        await EasyLoading.showError(json['status']);
      }
    } catch (e) {
      await EasyLoading.showError("Error: $e");
    }
  }

  static Future<void> register(
      String username, String email, String pass, BuildContext context) async {
    try {
      final response = await _client.post(
        _registerUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'uname': username, 'mail': email, 'passw': pass}),
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await EasyLoading.showSuccess(json['status']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        await EasyLoading.showError(json['status']);
      }
    } catch (e) {
      await EasyLoading.showError("Error: $e");
    }
  }
}
