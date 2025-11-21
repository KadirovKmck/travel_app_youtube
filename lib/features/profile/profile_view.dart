import 'package:flutter/material.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const _orange = Color(0xFFFF7B2C);
  static const _titleColor = Color(0xFF151827);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus(
      top: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: _titleColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFE6E0),
                      ),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundColor: Colors.transparent,
                        backgroundImage: const AssetImage(
                          'assets/images/person.png',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Leonardo',
                      style: TextStyle(
                        color: _titleColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change Profile Picture',
                        style: TextStyle(
                          color: _orange,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Fields
                    const _ProfileField(label: 'First Name', value: 'Leonardo'),
                    const SizedBox(height: 20),
                    const _ProfileField(label: 'Last Name', value: 'Ahmed'),
                    const SizedBox(height: 20),
                    const _ProfileField(
                      label: 'Location',
                      value: 'Kyrgyzstan 🇰🇬',
                    ),
                    const SizedBox(height: 20),

                    // Mobile with префиксом
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: _titleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        _MobileField(),
                      ],
                    ),

                    const SizedBox(height: 40),
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
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.04),
          ),
          child: Icon(icon, size: 22, color: const Color(0xFF1A1D26)),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileField({required this.label, required this.value});

  static const _fieldBg = Color(0xFFF7F7F9);
  static const _orange = Color(0xFFFF7B2C);
  static const _titleColor = Color(0xFF151827);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: _titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: _fieldBg,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: _titleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileField extends StatelessWidget {
  const _MobileField();

  static const _fieldBg = Color(0xFFF7F7F9);
  static const _orange = Color(0xFFFF7B2C);
  static const _titleColor = Color(0xFF151827);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: _fieldBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Row(
            children: const [
              Text(
                '+996',
                style: TextStyle(
                  color: _titleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(width: 18),
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: Color(0xFFE0E0E5),
          ),
          const SizedBox(width: 18),
          const Expanded(
            child: Text(
              '01758-000666',
              style: TextStyle(
                color: _titleColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
