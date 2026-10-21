import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PremiumShadowApp());
}

class PremiumShadowApp extends StatelessWidget {
  const PremiumShadowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shadow Tutorials',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const LoginScreen(), // <--- التطبيق يبدأ بشاشة القفل
    );
  }
}

// ==========================================
// 1. شاشة تسجيل الدخول (القفل)
// ==========================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passController = TextEditingController();
  bool _isError = false;

  void _checkPassword() {
    if (_passController.text == "12345") { // <--- كلمة المرور هنا
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 80, color: Color(0xFFD4AF37)),
              const SizedBox(height: 20),
              const Text(
                'SHADOW',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 5),
              ),
              const SizedBox(height: 10),
              const Text(
                'أدخل كلمة المرور للدخول',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: const Color(0xFF12121A),
                  errorText: _isError ? 'كلمة المرور خاطئة!' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFF30363D)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFD4AF37)),
                  ),
                ),
                onSubmitted: (_) => _checkPassword(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _checkPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'دخول',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. بيانات الدول
// ==========================================
class CountryData {
  final String title;
  final String flag;
  final String subtitle;
  final List<Color> gradient;
  final String youtubeUrl;

  CountryData({
    required this.title,
    required this.flag,
    required this.subtitle,
    required this.gradient,
    required this.youtubeUrl,
  });
}

final List<CountryData> countries = [
  CountryData(
    title: 'حساب أمريكي',
    flag: '🇺🇸',
    subtitle: 'Google Play / Apple ID',
    gradient: [const Color(0xFF0F52BA), const Color(0xFF041E42)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+usa+account+tutorial',
  ),
  CountryData(
    title: 'حساب فرنسي',
    flag: '🇫🇷',
    subtitle: 'للمحتوى الأوروبي',
    gradient: [const Color(0xFF002395), const Color(0xFFED2939)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+france+account+tutorial',
  ),
  CountryData(
    title: 'حساب بريطاني',
    flag: '🇬🇧',
    subtitle: 'أفضل للبرامج المدفوعة',
    gradient: [const Color(0xFF012169), const Color(0xFFC8102E)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+uk+account+tutorial',
  ),
  CountryData(
    title: 'حساب إماراتي',
    flag: '🇦🇪',
    subtitle: 'للمحتوى الخليجي',
    gradient: [const Color(0xFF00732F), const Color(0xFFFF0000)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+uae+account+tutorial',
  ),
  CountryData(
    title: 'حساب ياباني',
    flag: '🇯🇵',
    subtitle: 'للألعاب والأنمي',
    gradient: [const Color(0xFFBC002D), const Color(0xFF000000)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+japan+account+tutorial',
  ),
  CountryData(
    title: 'حساب كندي',
    flag: '🇨🇦',
    subtitle: 'بديل ممتاز للأمريكي',
    gradient: [const Color(0xFFFF0000), const Color(0xFF000000)],
    youtubeUrl: 'https://www.youtube.com/results?search_query=create+canada+account+tutorial',
  ),
];

// ==========================================
// 3. الشاشة الرئيسية (الشروحات)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF12121A), Color(0xFF0A0A0F)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4AF37).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
                      ),
                      child: const Text(
                        'PREMIUM • SHADOW TUTORIALS',
                        style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'اختر الدولة\nوشاهد الشرح',
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, height: 1.2),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: countries.length,
                  itemBuilder: (context, i) {
                    final country = countries[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(country: country))),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: country.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(color: country.gradient.first.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(right: -20, top: -20, child: Text(country.flag, style: const TextStyle(fontSize: 100, color: Colors.white10))),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(country.flag, style: const TextStyle(fontSize: 40)),
                                  const Spacer(),
                                  Text(country.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  const SizedBox(height: 4),
                                  Text(country.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                                ],
                              ),
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
      ),
    );
  }
}

// ==========================================
// 4. شاشة التفاصيل
// ==========================================
class DetailScreen extends StatelessWidget {
  final CountryData country;
  const DetailScreen({super.key, required this.country});

  Future<void> _openYoutube(BuildContext context) async {
    final uri = Uri.parse(country.youtubeUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح رابط اليوتيوب')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        title: Text('${country.flag} ${country.title}', style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: country.gradient),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(child: Text(country.flag, style: const TextStyle(fontSize: 80))),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () => _openYoutube(context),
                icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
                label: const Text('مشاهدة الشرح', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}