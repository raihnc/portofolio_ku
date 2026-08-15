import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/home_controller.dart';
import 'neo_brutalism_button.dart';

class CustomAppBar extends StatelessWidget {
  final HomeController controller;

  const CustomAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= AppValues.tabletBreakpoint;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.border,
            width: AppValues.borderWidth,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? AppValues.paddingXLarge
            : AppValues.paddingMedium,
        vertical: AppValues.paddingMedium,
      ),
      child: isDesktop ? _buildDesktopAppBar() : _buildMobileAppBar(),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: -0.5, end: 0, duration: 400.ms, curve: Curves.easeOut);
  }

  Widget _buildDesktopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'PORTOFOLIO',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppTheme.primary,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 200.ms)
            .slideX(begin: -0.3, end: 0),
        Row(
          children: [
            _menuButton('Tentang', controller.aboutKey, 0),
            const SizedBox(width: 16),
            _menuButton('Project', controller.projectsKey, 1),
            const SizedBox(width: 16),
            _menuButton('Pendidikan', controller.educationKey, 2),
            const SizedBox(width: 16),
            _menuButton('Tech Stack', controller.techStackKey, 3),
            const SizedBox(width: 16),
            _menuButton('Sertifikat', controller.certificateKey, 4),
            const SizedBox(width: 16),
            _menuButton('Kontak', controller.contactKey, 5),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'PORTOFOLIO',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppTheme.primary,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 200.ms)
            .slideX(begin: -0.3, end: 0),
        PopupMenuButton<GlobalKey>(
          icon: Icon(Icons.menu, color: AppTheme.primary, size: 28),
          onSelected: (key) => controller.scrollToSection(key),
          itemBuilder: (context) => [
            PopupMenuItem(value: controller.aboutKey, child: Text('Tentang')),
            PopupMenuItem(
              value: controller.projectsKey,
              child: Text('Project'),
            ),
            PopupMenuItem(
              value: controller.educationKey,
              child: Text('Pendidikan'),
            ),
            PopupMenuItem(
              value: controller.techStackKey,
              child: Text('Tech Stack'),
            ),
            PopupMenuItem(
              value: controller.certificateKey,
              child: Text('Sertifikat'),
            ),
            PopupMenuItem(value: controller.contactKey, child: Text('Kontak')),
          ],
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .scale(begin: Offset(0.5, 0.5), end: Offset(1, 1)),
      ],
    );
  }

  Widget _menuButton(String title, GlobalKey key, int index) {
    return NeoBrutalismButton(
      text: title,
      onPressed: () => controller.scrollToSection(key),
      backgroundColor: Colors.transparent,
      hasShadow: false,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    )
        .animate()
        .fadeIn(duration: 300.ms, delay: (250 + index * 50).ms)
        .slideY(begin: -0.5, end: 0, duration: 300.ms, delay: (250 + index * 50).ms);
  }
}
