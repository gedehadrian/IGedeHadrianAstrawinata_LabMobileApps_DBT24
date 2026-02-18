import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerSellerFormPage extends StatefulWidget {
  const BuyerSellerFormPage({super.key});

  @override
  State<BuyerSellerFormPage> createState() => _BuyerSellerFormPageState();
}

class _BuyerSellerFormPageState extends State<BuyerSellerFormPage>
    with SingleTickerProviderStateMixin {
  String? _selected;
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onSelect(String value) {
    setState(() => _selected = value);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      if (value == 'sell') {
        Navigator.pushNamed(context, '/seller-inquiry');
      } else {
        Navigator.pushNamed(context, '/how-did-you-know');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg2.png', fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      Image.asset('assets/images/logoRenuoil.png', height: 50),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Buyer or Seller?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B2A1A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Don't worry, you can change it later",
                    style: TextStyle(color: Color(0xFF5A3E2B), fontSize: 14),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Expanded(
                        child: _buildOption(
                          'buy',
                          'assets/images/iconCart.svg',
                          'Buy',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildOption(
                          'sell',
                          'assets/images/iconMoney.svg',
                          'Sell',
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
    );
  }

  Widget _buildOption(String value, String svgPath, String label) {
    final isSelected = _selected == value;
    return GestureDetector(
      onTap: () => _onSelect(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isSelected
                ? [const Color(0xFFF5C842), const Color(0xFFE5A800)]
                : [const Color(0xFFF5E070), const Color(0xFFD4B800)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isSelected ? 0.25 : 0.1),
              blurRadius: isSelected ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // REPLACED ICON WITH SVGPICTURE
            SvgPicture.asset(
              svgPath,
              width: 48,
              height: 48,
              colorFilter: const ColorFilter.mode(
                Color(0xFF3B2A1A),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B2A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
