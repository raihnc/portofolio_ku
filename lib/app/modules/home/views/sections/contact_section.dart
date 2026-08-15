import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../widgets/neo_brutalism_card.dart';
import '../widgets/neo_brutalism_button.dart';
import '../../controllers/home_controller.dart';

class ContactSection extends StatelessWidget {
  final HomeController controller;

  const ContactSection({super.key, required this.controller});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HUBUNGI SAYA',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w800,
              color: AppTheme.primary,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 32),
          NeoBrutalismCard(
            backgroundColor: const Color(0xFFB6F500),
            child: isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(isTablet),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: 200.ms),
          const SizedBox(height: 48),
          Center(
            child: Text(
              '© 2026 Portfolio. Dibangun dengan Flutter & Dart',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 400.ms)
              .slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildContactInfo(),
        const SizedBox(height: 24),
        _buildSocialButtons(),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        SizedBox(width: isTablet ? 32 : 48),
        SizedBox(width: isTablet ? 200 : 250, child: _buildSocialButtons()),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mari Berkolaborasi!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.primary,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email, controller.contactInfo['email']!, 0),
        const SizedBox(height: 12),
        _buildContactItem(Icons.phone, controller.contactInfo['phone']!, 1),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text, int index) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.cardBg,
            border: Border.all(color: AppTheme.border, width: 2),
          ),
          child: Icon(icon, size: 20, color: AppTheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.primary,
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (400 + 100 * index).ms)
        .slideX(begin: -0.2, end: 0, duration: 400.ms, delay: (400 + 100 * index).ms);
  }

  Widget _buildSocialButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NeoBrutalismButton(
          text: 'LinkedIn',
          icon: Icons.business,
          onPressed: () => _launchUrl(controller.contactInfo['linkedin']!),
          backgroundColor: AppTheme.cardBg,
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: 600.ms)
        .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1), duration: 400.ms, delay: 600.ms);
  }
}
