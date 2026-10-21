import 'package:flutter/material.dart';

void main() {
  runApp(const MusamApp());
}

class MusamApp extends StatelessWidget {
  const MusamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مصم',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _projectController = TextEditingController();
  String _selectedType = 'شعار (Logo)';

  void _createProject() {
    if (_projectController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال اسم المشروع أولاً')),
      );
      return;
    }
    
    // هنا نحاكي إنشاء المشروع
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF12121A),
        title: const Text('تم الإنشاء بنجاح ✅', style: TextStyle(color: Color(0xFFD4AF37))),
        content: Text('تم إنشاء مشروع "${_projectController.text}" من نوع $_selectedType'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF1E3C72), Color(0xFF0A0A0F)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xFF12121A).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.palette, size: 60, color: Color(0xFFD4AF37)),
                    const SizedBox(height: 15),
                    const Text(
                      'منصة مصم',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'مرحباً بك في مساحة العمل الفخمة الخاصة بك',
                      style: TextStyle(color: Color(0xFF8B949E), fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    
                    // حقل اسم المشروع
                    TextField(
                      controller: _projectController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'اسم المشروع',
                        labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                        filled: true,
                        fillColor: const Color(0xFF0F0F13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF30363D)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFD4AF37)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // اختيار نوع التصميم
                    DropdownButtonFormField<String>(
                      value: _selectedType,
                      dropdownColor: const Color(0xFF12121A),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'نوع التصميم',
                        labelStyle: const TextStyle(color: Color(0xFFD4AF37)),
                        filled: true,
                        fillColor: const Color(0xFF0F0F13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF30363D)),
                        ),
                      ),
                      items: ['شعار (Logo)', 'واجهة تطبيق (UI)', 'بوستر إعلاني']
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedType = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    
                    // زر الإنشاء
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _createProject,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'إنشاء مساحة العمل',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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