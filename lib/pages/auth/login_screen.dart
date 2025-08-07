import 'package:flutter/material.dart';
import 'package:xii_rpl_3/pages/auth/register_screen.dart';
import 'package:xii_rpl_3/pages/menu_screen.dart';
import 'package:xii_rpl_3/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    bool success = await _authService.login(
      email: emailController.text,
      password: passwordController.text,
    );
    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MenuScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal. Periksa email & password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, size: 60, color: Colors.blue),
                  SizedBox(height: 16),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton.icon(
                          icon: Icon(Icons.login),
                          onPressed: _login,
                          label: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()),
                      );
                    },
                    child: Text('Belum punya akun? Daftar di sini'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
