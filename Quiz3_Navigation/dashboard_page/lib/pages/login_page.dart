import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const _bgUrl =
      'https://lms.prasetiyamulya.ac.id/pluginfile.php/1/theme_moove/loginbgimg/1770083072/bg_login_mdl.jpg';
  static const _logoUrl =
      'https://lms.prasetiyamulya.ac.id/pluginfile.php/1/theme_moove/logo/1770083072/logo_upm_biru.png';

  OutlineInputBorder _border([
    Color color = const Color(0xFFBDBDBD),
    double w = 1,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(_bgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: 360,
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(blurRadius: 18, color: Colors.black12),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(_logoUrl, height: 80),
                    const SizedBox(height: 24),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(const Color(0xFF9E9E9E), 3),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(const Color(0xFF9E9E9E), 3),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Masuk ke Dashboard/Home (sesuai quiz)
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Lost password?",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "This site best viewed in Google Chrome.",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.help_sharp, size: 13, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "Cookies notice",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
