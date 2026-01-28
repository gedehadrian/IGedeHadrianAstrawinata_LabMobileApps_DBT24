import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const PlantDoctorApp());

class PlantDoctorApp extends StatelessWidget {
  const PlantDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JoinPlantDoctorPage(),
    );
  }
}

class JoinPlantDoctorPage extends StatelessWidget {
  const JoinPlantDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context); // keyboard
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundSimple(),

          // Frost overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(color: Colors.black.withValues(alpha: 0.10)),
            ),
          ),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    18,
                    16,
                    18,
                    16 + viewInsets.bottom, // biar ga ketutup keyboard
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top row (back + skip)
                      Row(
                        children: [
                          _GlassIcon(
                            onTap: () {},
                            icon: Icons.arrow_back_ios_new_rounded,
                          ),
                          const Spacer(),
                          _GlassPill(text: "Skip", onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Simple hero
                      const _HeroSimple(),
                      const SizedBox(height: 16),

                      // Title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Join Drian Community",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.92),
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create an account to unlock more scans and features.",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.62),
                            fontSize: 13.5,
                            height: 1.35,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Form glass
                      const _GlassCard(
                        child: Column(
                          children: [
                            _GlassField(
                              icon: Icons.person_rounded,
                              hint: "Name",
                            ),
                            SizedBox(height: 10),
                            _GlassField(
                              icon: Icons.email_rounded,
                              hint: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 10),
                            _GlassField(
                              icon: Icons.lock_rounded,
                              hint: "Password",
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Primary button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Text(
                        "Or log in with",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.62),
                          fontSize: 12.5,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Social (simple)
                      Row(
                        children: [
                          Expanded(
                            child: _GlassSocial(
                              label: "Google",
                              iconWidget: Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                              ),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _GlassSocial(
                              label: "Apple",
                              iconWidget: Icon(
                                Icons.apple,
                                size: 40.0,
                                color: Colors.white,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height < 750 ? 10 : 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ----------------- background (simpler) ----------------- */

class _BackgroundSimple extends StatelessWidget {
  const _BackgroundSimple();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2E7D4A), Color(0xFF0F2B1C), Color(0xFF08140E)],
          ),
        ),
      ),
    );
  }
}

/* ----------------- hero (simpler) ----------------- */

class _HeroSimple extends StatelessWidget {
  const _HeroSimple();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: 160,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 70,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF0E1A12).withValues(alpha: 0.90),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ),
      ),
    );
  }
}

/* ----------------- glass components (simple) ----------------- */

class _GlassIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const _GlassIcon({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.white.withValues(alpha: 0.10),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 18,
                color: Colors.white.withValues(alpha: 0.88),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassPill extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _GlassPill({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.white.withValues(alpha: 0.10),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;

  const _GlassField({
    required this.icon,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.90),
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Colors.white.withValues(alpha: 0.9),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          prefixIcon: Icon(icon, color: Colors.white.withValues(alpha: 0.78)),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _GlassSocial extends StatelessWidget {
  final String label;
  final Widget? iconWidget;
  final VoidCallback onTap;

  const _GlassSocial({
    required this.label,
    this.iconWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final leading =
        iconWidget ??
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.75),
              width: 1.6,
            ),
          ),
          child: Text(
            "",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.88),
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        );

    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Material(
          color: Colors.white.withValues(alpha: 0.08),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading,
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.84),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                    ),
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
