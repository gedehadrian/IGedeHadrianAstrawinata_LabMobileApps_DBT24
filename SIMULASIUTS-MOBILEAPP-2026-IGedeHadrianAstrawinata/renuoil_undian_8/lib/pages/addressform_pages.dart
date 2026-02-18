import 'package:flutter/material.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({super.key});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _zipController = TextEditingController();
  String? _selectedCountry;

  // List of countries
  final List<String> _countries = [
    'Indonesia',
    'Malaysia',
    'Singapore',
    'Thailand',
    'Philippines',
    'Vietnam',
    'United States',
    'United Kingdom',
    'Australia',
    'Others',
  ];

  void _onSave() {
    if (_cityController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in required fields')),
      );
      return;
    }
    Navigator.pushNamed(context, '/buyer-seller');
  }

  // --- CHANGED THIS FUNCTION ---
  void _showCountryPicker() {
    showDialog(
      context: context,
      builder: (context) {
        String? tempSelected = _selectedCountry;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Dialog(
              backgroundColor:
                  Colors.transparent, // Transparent to use Container's color
              insetPadding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7B4A1E),
                  borderRadius: BorderRadius.circular(
                    24,
                  ), // Rounded on all sides
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content height
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Country/Region',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Limit height of the list inside the dialog
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _countries.length,
                        itemBuilder: (context, index) {
                          final country = _countries[index];
                          final isSelected = tempSelected == country;
                          return GestureDetector(
                            onTap: () {
                              setModalState(() => tempSelected = country);
                              setState(() => _selectedCountry = country);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white.withOpacity(0.12),
                                    width: 1,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    country,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white70,
                                      fontSize: 15,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.white38,
                                        width: 2,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Center(
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg2.png', fit: BoxFit.cover),
          SafeArea(
            child: SingleChildScrollView(
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
                          color: Color(0xFF3B2A1A),
                          size: 28,
                        ),
                      ),
                      Image.asset('assets/images/logoRenuoil.png', height: 50),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Enter your address',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 4,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Custom Country/Region dropdown
                  _buildCustomDropdown(),

                  const SizedBox(height: 16),
                  _buildField(_cityController, 'City', const Color(0xFF7B4A1E)),
                  const SizedBox(height: 16),
                  _buildField(
                    _addressController,
                    'Address',
                    const Color(0xFFAA8866),
                  ),
                  const SizedBox(height: 16),
                  _buildField(
                    _zipController,
                    'ZIP code',
                    const Color(0xFFBBA888),
                    TextInputType.number,
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'You can change it later*',
                      style: TextStyle(color: Color(0xFF7B4A1E), fontSize: 12),
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

  Widget _buildCustomDropdown() {
    return GestureDetector(
      onTap: _showCountryPicker,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF7B4A1E),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedCountry ?? 'Country/Region',
              style: TextStyle(
                color: _selectedCountry != null ? Colors.white : Colors.white60,
                fontSize: 15,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String hint,
    Color bgColor, [
    TextInputType? keyboardType,
  ]) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
