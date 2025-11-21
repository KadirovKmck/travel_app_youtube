import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.48,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/images/home1.png',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.20),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 68),
                              child: const Text(
                                'Details',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 64,
                            left: 24,
                            child: _CircleIconButton(
                              icon: Icons.arrow_back_ios_new_rounded,
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Positioned(
                            top: 64,
                            right: 24,
                            child: const _CircleIconButton(
                              icon: Icons.bookmark_border_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Niladri Reservoir',
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF111827),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Tekergat, Sunamgnj',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const CircleAvatar(
                                    radius: 28,
                                    backgroundImage: AssetImage(
                                      'assets/images/person1.png',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: Color(0xFF6B7280),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Tekergat',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: Color(0xFFFFB020),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.7 ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF111827),
                                    ),
                                  ),
                                  Text(
                                    '(2498)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$59',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0EA5E9),
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '/Person',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                height: 72,
                                child: Row(
                                  children: [
                                    _GalleryItem('assets/images/q.png'),
                                    const SizedBox(width: 12),
                                    _GalleryItem('assets/images/w.png'),
                                    const SizedBox(width: 12),
                                    _GalleryItem('assets/images/e.png'),
                                    const SizedBox(width: 12),
                                    _GalleryItem('assets/images/r.png'),
                                    const SizedBox(width: 12),
                                    _GalleryMoreItem('assets/images/t.png'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),

                              const Text(
                                'About Destination',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 12),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.6,
                                    color: Color(0xFF6B7280),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended hotel rooms, transportation, Have you ever been on holiday to the Greek ETC...',
                                    ),
                                    TextSpan(
                                      text: ' Read More',
                                      style: TextStyle(
                                        color: Color(0xFFFF5A1F),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor: const Color(0xFF51B9F2),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleIconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.18),
          ),
          child: Icon(icon, size: 22, color: Colors.white),
        ),
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  final String asset;

  const _GalleryItem(this.asset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Image.asset(asset, fit: BoxFit.cover),
      ),
    );
  }
}

class _GalleryMoreItem extends StatelessWidget {
  final String asset;

  const _GalleryMoreItem(this.asset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(asset, fit: BoxFit.cover),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.25),
                  ],
                ),
              ),
              child: const Text(
                '+16',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
