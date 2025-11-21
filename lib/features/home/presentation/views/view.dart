import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

class ViewHomeIn extends StatelessWidget {
  const ViewHomeIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ScaffoldPlus(
      top: false,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/house.png', fit: BoxFit.fill),
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.of(context).pop(),
                  ),

                  const Text(
                    'Map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            Positioned(
              top: 170,
              right: 36,
              child: _PlaceBubble(
                imagePath: 'assets/images/t.png',
                title: 'La-Hotel',
                distance: '2.09 mi',
                alignRight: true,
              ),
            ),
            Positioned(
              top: size.height * 0.26,
              right: 64,
              child: Column(
                children: [
                  Container(
                    width: 2,
                    height: 80,
                    color: Colors.black.withOpacity(0.25),
                  ),
                  _SmallCircle(),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.40,
              left: 36,
              child: _PlaceBubble(
                imagePath: 'assets/images/e.png',
                title: 'Lemon Garden',
                distance: '2.09 mi',
                alignRight: false,
              ),
            ),
            Positioned(
              top: size.height * 0.46,
              left: 72,
              child: Column(
                children: [
                  Container(
                    width: 2,
                    height: 90,
                    color: Colors.black.withOpacity(0.25),
                  ),
                  _SmallCircle(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 26),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B313A).withOpacity(0.94),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            'Niladri Reservoir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Tekergat, Sunamgnj',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.white70,
                              size: 18,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '45 Minutes',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        _AvatarStrip(),
                      ],
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF32B5FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'See On The Map',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
      color: Colors.white.withOpacity(0.15),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 48,
          height: 48,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceBubble extends StatelessWidget {
  final String imagePath;
  final String title;
  final String distance;
  final bool alignRight;

  const _PlaceBubble({
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.alignRight,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(24);

    final content = Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF3C4047).withOpacity(0.95),
        borderRadius: radius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                distance,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );

    return content;
  }
}

class _SmallCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF2FB7FF),
        border: Border.all(color: Colors.white, width: 3),
      ),
    );
  }
}

class _AvatarStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 36,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _avatar(0, 'assets/images/person1.png'),
          _avatar(18, 'assets/images/person.png'),
          _avatar(36, 'assets/images/person3.png'),
          Positioned(
            left: 54,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  '+50',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar(double left, String path) {
    return Positioned(
      left: left,
      child: CircleAvatar(radius: 16, backgroundImage: AssetImage(path)),
    );
  }
}
