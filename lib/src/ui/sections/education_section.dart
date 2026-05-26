import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/education.dart';
import '../../utils/responsive_utils.dart';
import '../widgets/animations/fade_in_up_animation.dart';

class EducationSection extends StatelessWidget {
  final GlobalKey? sectionKey;

  const EducationSection({super.key, this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final theme = Theme.of(context);

    return Container(
      key: sectionKey,
      padding: ResponsiveUtils.getResponsivePadding(context).copyWith(
        top: isMobile ? 60 : 100,
        bottom: isMobile ? 20 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: ResponsiveUtils.getMaxContentWidth(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Education',
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 32),
              ),
              const SizedBox(height: 40),
              ...EducationSchools.values.asMap().entries.map((entry) {
                final edu = entry.value;
                return FadeInUpAnimation(
                  delay: Duration(milliseconds: 200 * entry.key),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                edu.schoolName,
                                style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            Text(
                              edu.dateRange.forResume,
                              style: TextStyle(
                                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${edu.degreeName} in ${edu.fieldOfStudy}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          edu.description,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}