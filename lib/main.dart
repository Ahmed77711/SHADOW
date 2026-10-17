import 'package:flutter/material.dart';

void main() {
  runApp(const PremiumTutorialsApp());
}

class PremiumTutorialsApp extends StatelessWidget {
  const PremiumTutorialsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
      ),
      home: const HomeScreen(),
    );
  }
}

class Tutorial {
  final String country;
  final String flag;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final String youtubeUrl;
  final List<String> steps;

  const Tutorial({
    required this.country,
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.youtubeUrl,
    required this.steps,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Tutorial> tutorials = [
    Tutorial(
      country: 'USA',
      flag: '🇺🇸',
      title: 'حساب أمريكي',
      subtitle: 'Google Play / Apple ID',
      gradient: [Color(0xFF0F52BA), Color(0xFF041E42)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+usa+account+tutorial',
      steps: ['افتح VPN على أمريكا', 'ادخل على Gmail وانشئ حساب جديد', 'اختار الدولة United States', 'اكد برقم أمريكي وهمي من موقع TextNow'],
    ),
    Tutorial(
      country: 'France',
      flag: '🇫🇷',
      title: 'حساب فرنسي',
      subtitle: 'للمحتوى الأوروبي',
      gradient: [Color(0xFF002395), Color(0xFFED2939)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+france+account+tutorial',
      steps: ['VPN فرنسا', 'انشاء حساب جديد', 'الدولة France', 'استخدم كود بريدي فرنسي 75001'],
    ),
    Tutorial(
      country: 'UK',
      flag: '🇬🇧',
      title: 'حساب بريطاني',
      subtitle: 'أفضل للبرامج المدفوعة',
      gradient: [Color(0xFF012169), Color(0xFFC8102E)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+uk+account+tutorial',
      steps: ['VPN بريطانيا', 'انشاء حساب', 'الدولة United Kingdom', 'كود بريدي SW1A 1AA'],
    ),
    Tutorial(
      country: 'Japan',
      flag: '🇯🇵',
      title: 'حساب ياباني',
      subtitle: 'للألعاب والأنمي',
      gradient: [Color(0xFFBC002D), Color(0xFF000000)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+japan+account+tutorial',
      steps: ['VPN اليابان', 'حساب جديد', 'الدولة Japan', 'اسم ياباني وكود 100-0001'],
    ),
    Tutorial(
      country: 'Hong Kong',
      flag: '🇭🇰',
      title: 'حساب هونج كونج',
      subtitle: 'للألعاب قبل نزولها',
      gradient: [Color(0xFFDE2910), Color(0xFFFFDE00)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+hong+kong+account+tutorial',
      steps: ['VPN هونج كونج', 'انشاء حساب', 'الدولة Hong Kong', 'أسهل حساب بدون رقم'],
    ),
    Tutorial(
      country: 'Canada',
      flag: '🇨🇦',
      title: 'حساب كندي',
      subtitle: 'بديل ممتاز للأمريكي',
      gradient: [Color(0xFFFF0000), Color(0xFF000000)],
      youtubeUrl: 'https://www.youtube.com/results?search_query=create+canada+account+tutorial',
      steps: ['VPN كندا', 'حساب جديد', 'الدولة Canada', 'كود بريدي K1A 0B1'],
    ),
  ];

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
                        color: const Color(0xFFB5828D).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFB5828D).withOpacity(0.5)),
                      ),
                      child: const Text('PREMIUM • SHADOW TUTORIALS',
                          style: TextStyle(color: Color(0xFFB5828D), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 16),
                    const Text('اختار الدولة\nوشوف الشرح',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
                    const SizedBox(height: 8),
                    Text('كل حساب معاه فيديو مباشر من يوتيوب + خطوات',
                        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13)),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: tutorials.length,
                  itemBuilder: (context, i) {
                    final t = tutorials[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(tutorial: t))),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: t.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [BoxShadow(color: t.gradient[0].withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                        ),
                        child: Stack(
                          children: [
                            Positioned(right: -20, top: -20, child: Text(t.flag, style: const TextStyle(fontSize: 100, color: Colors.white10))),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(t.flag, style: const TextStyle(fontSize: 38)),
                                  const Spacer(),
                                  Text(t.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                                  const SizedBox(height: 4),
                                  Text(t.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.play_arrow_rounded, size: 16, color: Colors.black),
                                        SizedBox(width: 4),
                                        Text('شاهد الشرح', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  )
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

class DetailScreen extends StatelessWidget {
  final Tutorial tutorial;
  const DetailScreen({super.key, required this.tutorial});

  Future<void> _openYoutube(BuildContext context) async {
    final uri = Uri.parse(tutorial.youtubeUrl);
    
    // استخدام dynamic لتجاهل أخطاء المحرر

    dynamic mode = LaunchMode.externalApplication;
    
    bool didLaunch = await launcher(uri, mode: mode);
    
    if (!didLaunch) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('مش قادر افتح اليوتيوب')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('${tutorial.flag} ${tutorial.title}', style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: tutorial.gradient),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: tutorial.gradient[0].withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tutorial.flag, style: const TextStyle(fontSize: 70)),
                    const SizedBox(height: 10),
                    Text(tutorial.title, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                    Text(tutorial.subtitle, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('خطوات انشاء الحساب:', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...tutorial.steps.asMap().entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28, height: 28,
                    decoration: BoxDecoration(color: tutorial.gradient[0], shape: BoxShape.circle),
                    child: Center(child: Text('${e.key + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(e.value, style: const TextStyle(color: Colors.white70))),
                ],
              ),
            )),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openYoutube(context),
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                label: const Text('فتح فيديو الشرح على يوتيوب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}