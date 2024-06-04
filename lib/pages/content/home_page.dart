import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage == 3) nextPage = 0;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        _autoSlide();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/forge logo-white.png',
          height: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 3, 82, 147),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(width: 15)),
              Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.circular(15), // Menambah radius container
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(4), // Menambah radius gambar
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildPage('assets/images/banner1.png'),
                      _buildPage('assets/images/banner2.png'),
                      _buildPage('assets/images/banner3.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Jarak antara banner dan button
              Container(
                width: double.infinity,
                child: Center(
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 5, 43, 75),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSubBox(
                                'Bengkel', 'assets/images/map-pin.png'),
                            _buildSubBox(
                                'Reservasi', 'assets/images/reservasi-now.png'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSubBox(
                                'Promo', 'assets/images/discount-Filled.png'),
                            _buildSubBox(
                                'Jadwal', 'assets/images/calendar.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Jarak antara button dan card
              _buildCard(
                'assets/images/banner-card1.png',
                'Paket Full Service',
                'Full Service Hemat & Lengkap!',
                'Rawat mobilmu di bengkel kami.',
              ),
              _buildCard(
                'assets/images/banner-card2.png',
                'Paket Ganti Oli',
                'Ganti oli berkualitas.  Bengkel',
                'kami menyediakan oli terbaik.',
              ),
              _buildCard(
                'assets/images/banner-card3.png',
                'Paket Tune Up',
                ' Atasi mesin lemot & boros BBM!',
                'Paket Tune Up Lengkap & Hemat di Bengkel Kami!',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        const Center(
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
    String imagePath,
    String title,
    String subtitle1,
    String subtitle2,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1D3557),
              Color(0xFF457B9D),
              Color.fromARGB(255, 129, 174, 175),
              Color(0xFFA8DADC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10), // Memberikan spasi antara teks
                    Text(
                      subtitle1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      subtitle2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      stops: [0.0, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width:
                        double.infinity, // Mengisi seluruh lebar yang tersedia
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubBox(String text, String imagePath) {
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 5, 43, 75),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.keyboard_arrow_right_sharp,
              color: Color.fromARGB(255, 5, 43, 75)),
        ],
      ),
    );
  }
}
