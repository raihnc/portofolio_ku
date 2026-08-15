import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../widgets/neo_brutalism_card.dart';
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
      padding: EdgeInsets.all(
        isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
      ),
      child: NeoBrutalismCard(
        backgroundColor: AppTheme.secondary,
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(isTablet),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, curve: Curves.easeOut)
        .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOut);
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildImage(120),
        const SizedBox(height: 24),
        _buildContent(),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      children: [
        _buildImage(isTablet ? 180 : 250),
        SizedBox(width: isTablet ? 32 : 48),
        Expanded(child: _buildContent()),
      ],
    );
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
    )
        .animate()
        .scale(duration: 600.ms, delay: 200.ms, curve: Curves.easeOut)
        .then()
        .shimmer(duration: 1000.ms, color: Colors.white.withOpacity(0.3));
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TENTANG SAYA',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.primary,
            letterSpacing: 2,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 12),
        Text(
          controller.aboutMe['name']!,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: AppTheme.primary,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 400.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 8),
        Text(
          controller.aboutMe['title']!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppTheme.primary,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 500.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          controller.aboutMe['description']!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppTheme.textPrimary,
            height: 1.6,
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 600.ms)
            .slideX(begin: -0.2, end: 0),
      ],
    );
  }
}
