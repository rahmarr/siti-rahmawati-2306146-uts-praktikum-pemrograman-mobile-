import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _rankController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF69B4).withValues(alpha: 0.2),
                            blurRadius: 25,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 60,
                        color: Color(0xFFFF69B4),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      "🎀 hello lovely 🎀",
                      style: GoogleFonts.pacifico(
                        fontSize: 28,
                        color: const Color(0xFFFF69B4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Text(
                      "let's begin your sweet adventure 💕",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.pinkAccent.withValues(alpha: 0.7),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  _buildLabel("your name 💕"),
                  _buildTextField(_nameController, "sweet name...", false),

                  const SizedBox(height: 16),

                  _buildLabel("your level ✨"),
                  _buildTextField(_levelController, "magic level...", true),

                  const SizedBox(height: 16),

                  _buildLabel("your rank 👑"),
                  _buildTextField(_rankController, "princess rank...", false),

                  const SizedBox(height: 16),

                  _buildLabel("your job 🧁"),
                  _buildTextField(_jobController, "dream job...", false),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF69B4),
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.pinkAccent.withValues(alpha: 0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, "/", arguments: {
                            "name": _nameController.text,
                            "level": _levelController.text,
                            "rank": _rankController.text,
                            "job": _jobController.text,
                          });
                        }
                      },
                      child: Text(
                        "begin your journey 🎀",
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFD02090),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, bool isNumber) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: GoogleFonts.quicksand(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.quicksand(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.pinkAccent.withValues(alpha: 0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFFF69B4), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "don't leave this empty 💕";
        if (isNumber && int.tryParse(value) == null) return "numbers only please 💫";
        return null;
      },
    );
  }
}