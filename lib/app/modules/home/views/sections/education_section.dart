import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../widgets/neo_brutalism_card.dart';
import '../../controllers/home_controller.dart';

class EducationSection extends StatelessWidget {
  final HomeController controller;

  const EducationSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppValues.paddingLarge : AppValues.paddingXXLarge,
        vertical: AppValues.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PENDIDIKAN',
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
          ...controller.education.asMap().entries.map((entry) {
            final index = entry.key;
            final edu = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: NeoBrutalismCard(
                backgroundColor: AppTheme.surfaceContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            edu.institution,
                            style: GoogleFonts.ebGaramond(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.secondary,
                            border: Border.all(
                              color: AppTheme.border,
                              width: AppValues.borderWidth,
                            ),
                          ),
                          child: Text(
                            edu.period,
                            style: GoogleFonts.spaceMono(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 200).ms)
                        .slideX(begin: -0.2, end: 0),
                    const SizedBox(height: 8),
                    Text(
                      edu.degree,
                      style: GoogleFonts.spaceMono(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textSecondary,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 300).ms)
                        .slideX(begin: -0.2, end: 0),
                    const SizedBox(height: 8),
                    Text(
                      edu.description,
                      style: GoogleFonts.spaceMono(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 400).ms)
                        .slideX(begin: -0.2, end: 0),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: (150 * index).ms)
                  .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: (150 * index).ms),
            );
          }).toList(),
        ],
      ),
    );
  }
}
