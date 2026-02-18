import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SellerInquiryPage extends StatefulWidget {
  const SellerInquiryPage({super.key});

  @override
  State<SellerInquiryPage> createState() => _SellerInquiryPageState();
}

class _SellerInquiryPageState extends State<SellerInquiryPage> {
  final _shopNameController = TextEditingController();
  final _shopDescController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _fullNameController = TextEditingController();
  bool _acceptTerms = false;

  File? _shopLogoFile;
  File? _personalIdFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage({required bool isShopLogo}) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? picked = await _picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 80,
                );
                if (picked != null) {
                  setState(() {
                    if (isShopLogo) {
                      _shopLogoFile = File(picked.path);
                    } else {
                      _personalIdFile = File(picked.path);
                    }
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? picked = await _picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 80,
                );
                if (picked != null) {
                  setState(() {
                    if (isShopLogo) {
                      _shopLogoFile = File(picked.path);
                    } else {
                      _personalIdFile = File(picked.path);
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _onSave() {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the terms and privacy policy'),
        ),
      );
      return;
    }
    if (_shopNameController.text.trim().isEmpty ||
        _fullNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }
    Navigator.pushNamed(context, '/how-did-you-know');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Seller Inquiry',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Before we proceed, please submit the required\ndocuments, such as an ID card and shop address.',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const SizedBox(height: 28),

                    _sectionLabel('Shop name'),
                    _buildTextField(
                      _shopNameController,
                      'example : EcoPure Shops',
                    ),
                    const SizedBox(height: 20),

                    _sectionLabel('Shop Logo'),
                    _buildPhotoBox(
                      file: _shopLogoFile,
                      onTap: () => _pickImage(isShopLogo: true),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Maximal : 12 MB',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    const SizedBox(height: 20),

                    _sectionLabel('Shop Description'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _shopDescController,
                        maxLines: 5,
                        maxLength: 500,
                        decoration: const InputDecoration(
                          hintText:
                              'Example :"Recycle used cooking oil easily with Revivo! Turn waste into a resource and help the planet. Start recycling today!"',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(14),
                        ),
                      ),
                    ),

                    const Divider(height: 40),

                    const Text(
                      'Personal Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _sectionLabel('Nickname'),
                    _buildTextField(_nicknameController, 'example: Kevin'),
                    const SizedBox(height: 20),

                    _sectionLabel('Full Name'),
                    _buildTextField(
                      _fullNameController,
                      'example: Kevin Ganteng',
                    ),
                    const SizedBox(height: 20),

                    _sectionLabel('Personal ID'),
                    _buildPhotoBox(
                      file: _personalIdFile,
                      onTap: () => _pickImage(isShopLogo: false),
                    ),
                    const SizedBox(height: 32),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              setState(() => _acceptTerms = !_acceptTerms),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _acceptTerms
                                  ? const Color(0xFFD4B800)
                                  : Colors.transparent,
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: _acceptTerms
                                ? const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'I accept the terms and privacy policy',
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoBox({required File? file, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: file != null
                ? const Color(0xFFD4B800)
                : Colors.grey.shade300,
            width: file != null ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: file != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.file(
                  file,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/iconFileInput.svg',
                    width: 40,
                    height: 48,

                    placeholderBuilder: (_) => const SizedBox(
                      width: 40,
                      height: 48,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFFD4B800),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Add Photos',
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                ],
              ),
      ),
    );
  }
}
