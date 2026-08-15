import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      padding: EdgeInsets.all(
        isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PENDIDIKAN',
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
          ...controller.education.asMap().entries.map((entry) {
            final index = entry.key;
            final edu = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: NeoBrutalismCard(
                backgroundColor: AppTheme.cardBg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      edu.degree,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 200).ms)
                        .slideX(begin: -0.2, end: 0),
                    const SizedBox(height: 8),
                    Text(
                      edu.institution,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 300).ms)
                        .slideX(begin: -0.2, end: 0),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.secondary,
                        border: Border.all(color: AppTheme.border, width: 2),
                      ),
                      child: Text(
                        edu.period,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primary,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 400).ms)
                        .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1)),
                    const SizedBox(height: 12),
                    Text(
                      edu.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textSecondary,
                        height: 1.6,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: (200 * index + 500).ms)
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
