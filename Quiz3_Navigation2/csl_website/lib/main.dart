import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/* ===================== ROOT ===================== */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: STEMPrasmulPage(),
    );
  }
}

/* ===================== PAGE ===================== */

class STEMPrasmulPage extends StatelessWidget {
  const STEMPrasmulPage({super.key});

  // ===== COLORS =====
  static const _appRed = Color(0xFF8B0000);
  static const _sheetBg = Color(0xFF333333);

  // ===== ASSETS (NETWORK) =====
  static const _logoWhite =
      'https://www.prasetiyamulya.ac.id/office/publishing/wp-content/uploads/2021/03/Prasmul_logo_01-Putih.png';
  static const _logoBlue =
      'https://www.prasetiyamulya.ac.id/wp-content/uploads/2020/01/Logo-Universitas-Prasetiya-Mulya.png';

  // ===== TEXT STYLES =====
  static const _titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: Colors.black87,
    height: 1.1,
    letterSpacing: 0.2,
  );

  static const _bodyStyle = TextStyle(
    fontSize: 16,
    height: 1.55,
    color: Color(0xFF7C7C7C),
    fontWeight: FontWeight.w500,
  );

  static const _footerStyle = TextStyle(
    color: Color(0xFFBDBDBD),
    fontSize: 11.8,
    height: 1.35,
    fontWeight: FontWeight.w500,
  );

  /* ===================== BOTTOM SHEET ===================== */

  void _showFullMenu(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _sheetBg,
      barrierColor: Colors.black54,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (_) => SizedBox(
        height: h * 0.72,
        width: double.infinity,
        child: const _MenuSheet(),
      ),
    );
  }

  /* ===================== UI ===================== */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: _appRed,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 12,
        title: const _AppBarLogo(),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _showFullMenu(context),
          ),
          const SizedBox(width: 6),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),

            Image.network(_logoBlue, width: 370),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _Section(
                    title: "VISION",
                    body:
                        "A globally recognized School for\nSTEMpreneur Education and Research",
                  ),
                  SizedBox(height: 28),
                  _Section(
                    title: "MISSION",
                    body:
                        "Provide quality STEM education and research\nfor nurturing the holistic citizen graduates\nthrough:\n\n"
                        "1. Collaborative learning by enterprising\n"
                        "involving interdisciplinary catalytic projects\n\n"
                        "2. Innovative and impactful research to the\n"
                        "society",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 200),

            const _Footer(),
          ],
        ),
      ),
    );
  }
}

/* ===================== COMPONENTS ===================== */

class _AppBarLogo extends StatelessWidget {
  const _AppBarLogo();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      STEMPrasmulPage._logoWhite,
      height: 28,
      fit: BoxFit.contain,
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String body;

  const _Section({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: STEMPrasmulPage._titleStyle),
        const SizedBox(height: 8),
        Text(body, style: STEMPrasmulPage._bodyStyle),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            STEMPrasmulPage._logoWhite,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 10),
          Text(
            "BSD City Kavling Edutown I.1\n"
            "Jl. BSD Raya Utama, BSD City 15339\n"
            "Kabupaten Tangerang, Indonesia",
            style: STEMPrasmulPage._footerStyle,
          ),
          SizedBox(height: 10),
          Text("Tel. (021) 304-50-500", style: STEMPrasmulPage._footerStyle),
          Text("Hp. (+62) 81512862005", style: STEMPrasmulPage._footerStyle),
          SizedBox(height: 10),
          Text(
            "info@prasetiyamulya.ac.id",
            style: TextStyle(
              color: Color(0xFFE0E0E0),
              fontSize: 11.8,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuSheet extends StatelessWidget {
  const _MenuSheet();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: const [
        _SheetItem(title: "PROGRAMS"),
        _SheetDivider(),
        _SheetItem(title: "ADMISSION"),
        _SheetDivider(),
        _SheetItem(title: "PEOPLE"),
        _SheetDivider(),
        _SheetItem(title: "LABORATORY"),
        _SheetDivider(),
        _SheetItem(title: "CAMPUS LIFE"),
        _SheetDivider(),
        _SheetItem(title: "OFFICE & SERVICES"),
      ],
    );
  }
}

class _SheetItem extends StatelessWidget {
  final String title;
  const _SheetItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class _SheetDivider extends StatelessWidget {
  const _SheetDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 0.7, color: Color(0x44FFFFFF));
  }
}
