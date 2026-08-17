import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/home_controller.dart';

class AboutSection extends StatelessWidget {
  final HomeController controller;

  const AboutSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppValues.paddingLarge
            : AppValues.paddingXXLarge,
        vertical: isMobile
            ? AppValues.paddingLarge
            : AppValues.paddingXLarge * 2,
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(isTablet),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDisplayTitle(true),
        const SizedBox(height: 24),
        _buildImage(200),
        const SizedBox(height: 24),
        _buildContent(true),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDisplayTitle(false),
              const SizedBox(height: 24),
              _buildContent(false),
            ],
          ),
        ),
        SizedBox(width: isTablet ? 32 : 48),
        _buildImage(isTablet ? 280 : 380),
      ],
    );
  }

  Widget _buildDisplayTitle(bool isMobile) {
    return Text(
          'M RAYHAN\nCAESAR\nAGUNG',
          style: GoogleFonts.ebGaramond(
            fontSize: isMobile ? 48 : 84,
            fontWeight: FontWeight.w700,
            height: 1.05,
            color: AppTheme.textPrimary,
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, curve: Curves.easeOut)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut);
  }

  Widget _buildImage(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.border,
          width: AppValues.borderWidth,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.border,
            offset: Offset(AppValues.shadowOffset, AppValues.shadowOffset),
          ),
        ],
      ),
      child: Image.asset(controller.aboutMe['image']!, fit: BoxFit.cover),
    ).animate().scale(duration: 600.ms, delay: 200.ms, curve: Curves.easeOut);
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.tertiary,
                border: Border.all(
                  color: AppTheme.border,
                  width: AppValues.borderWidth,
                ),
              ),
              child: Text(
                controller.aboutMe['title']!.toUpperCase(),
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
              controller.aboutMe['description']!,
              style: GoogleFonts.spaceMono(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w400,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            )
            .animate()
            .fadeIn(duration: 400.ms, delay: 400.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 24),
        _buildSkillsTags(),
      ],
    );
  }

  Widget _buildSkillsTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _tag('FLUTTER'),
        _tag('DART'),
        _tag('ANDROID'),
        _tag('FIREBASE'),
        _tag('UI/UX'),
      ],
    ).animate().fadeIn(duration: 400.ms, delay: 500.ms);
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        border: Border.all(
          color: AppTheme.border,
          width: AppValues.borderWidth,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.spaceMono(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }
}
