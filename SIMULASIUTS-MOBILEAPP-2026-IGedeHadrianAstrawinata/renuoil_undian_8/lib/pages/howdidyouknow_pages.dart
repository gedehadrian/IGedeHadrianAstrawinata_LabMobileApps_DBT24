import 'package:flutter/material.dart';

class HowDidYouKnowPage extends StatefulWidget {
  const HowDidYouKnowPage({super.key});

  @override
  State<HowDidYouKnowPage> createState() => _HowDidYouKnowPageState();
}

class _HowDidYouKnowPageState extends State<HowDidYouKnowPage> {
  String? _selected;
  final _otherController = TextEditingController();

  final List<String> _options = [
    'Social Media',
    'Family',
    'Friends',
    'Posters',
    'Others...',
  ];

  void _onSave() {
    if (_selected == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an option')));
      return;
    }
    Navigator.pushNamed(context, '/address');
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
                  const SizedBox(height: 48),
                  const Text(
                    'How did you\nknow ReNuOil?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2), // geser shadow (x, y)
                          blurRadius: 4, // blur bayangan
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ..._options.map((option) => _buildOption(option)),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF7B4F2E),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String label) {
    final isSelected = _selected == label;
    return GestureDetector(
      onTap: () => setState(() => _selected = label),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFFD4B800)
                    : const Color(0xFFEDD96A).withValues(alpha: 0.6),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFAA8800)
                      : const Color(0xFFD4B800),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected
                    ? const Color(0xFF3B2A1A)
                    : const Color(0xFF5A3E2B),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
