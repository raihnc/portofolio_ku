import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppValues.paddingLarge : AppValues.paddingXXLarge,
            vertical: AppValues.paddingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HUBUNGI SAYA',
                style: GoogleFonts.ebGaramond(
                  fontSize: isMobile ? 28 : 48,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideX(begin: -0.2, end: 0),
              const SizedBox(height: 24),
              NeoBrutalismCard(
                backgroundColor: AppTheme.tertiary,
                child: isMobile
                    ? _buildMobileLayout()
                    : _buildDesktopLayout(isTablet),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: 200.ms),
            ],
          ),
        ),
        // Dark footer
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppTheme.inverseSurface,
            border: Border(
              top: BorderSide(
                color: AppTheme.border,
                width: AppValues.borderWidth,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppValues.paddingLarge : AppValues.paddingXXLarge,
            vertical: AppValues.paddingXLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.aboutMe['name']!,
                style: GoogleFonts.ebGaramond(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.inverseOnSurface,
                ),
              )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 400.ms),
              const SizedBox(height: 8),
              Text(
                'Dibangun dengan Flutter & Dart',
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.inverseOnSurface.withOpacity(0.6),
                ),
              )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 500.ms),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 600.ms),
      ],
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
        SizedBox(width: isTablet ? 200 : 280, child: _buildSocialButtons()),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mari Berkolaborasi!',
          style: GoogleFonts.ebGaramond(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppTheme.inverseOnSurface,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email_outlined, controller.contactInfo['email']!, 0),
        const SizedBox(height: 12),
        _buildContactItem(Icons.phone_outlined, controller.contactInfo['phone']!, 1),
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
            border: Border.all(color: AppTheme.border, width: AppValues.borderWidth),
          ),
          child: Icon(icon, size: 18, color: AppTheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.spaceMono(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.inverseOnSurface,
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
          textColor: AppTheme.primary,
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: 600.ms)
        .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1), duration: 400.ms, delay: 600.ms);
  }
}
