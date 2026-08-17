import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../widgets/neo_brutalism_card.dart';
import '../../controllers/home_controller.dart';

class TechStackSection extends StatelessWidget {
  final HomeController controller;

  const TechStackSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    // ignore: unused_local_variable
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? AppValues.paddingLarge
            : AppValues.paddingXXLarge,
        vertical: AppValues.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECH STACK',
            style: GoogleFonts.ebGaramond(
              fontSize: isMobile ? 28 : 48,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
          const SizedBox(height: 24),
          NeoBrutalismCard(
                backgroundColor: AppTheme.surfaceContainer,
                padding: EdgeInsets.all(
                  isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge,
                ),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: controller.techStack
                      .asMap()
                      .entries
                      .map(
                        (entry) => _buildTechChip(entry.value.name, entry.key),
                      )
                      .toList(),
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildTechChip(String name, int index) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.cardBg,
            border: Border.all(
              color: AppTheme.border,
              width: AppValues.borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.border,
                offset: const Offset(
                  AppValues.shadowOffset,
                  AppValues.shadowOffset,
                ),
              ),
            ],
          ),
          child: Text(
            name.toLowerCase(),
            style: GoogleFonts.spaceMono(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 400.ms, delay: (100 * index).ms)
        .scale(
          begin: Offset(0.85, 0.85),
          end: Offset(1, 1),
          duration: 400.ms,
          delay: (100 * index).ms,
        );
  }
}
