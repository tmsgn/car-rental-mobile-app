import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';

class RentalAgreementScreen extends StatelessWidget {
  const RentalAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Rental Agreement')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Master Rental Agreement', style: AppTypography.textTheme.displaySmall),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Last updated: August 2026',
              style: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildSection(
              '1. Vehicle Condition and Return',
              'You must return the Vehicle to our rental office or other location we specify, on the date and time specified in this Agreement, and in the same condition that you received it, except for ordinary wear. If the Vehicle is returned after closing hours, you remain responsible for the safety of, and any damage to, or loss of, the Vehicle until we inspect it upon our next opening for business.',
            ),
            _buildSection(
              '2. Authorized Drivers',
              'The Vehicle may be driven only by an Authorized Driver. An Authorized Driver is the renter and any additional person who appears at the time of rental and signs this Agreement. All Authorized Drivers must satisfy our age requirements, have a valid driver\'s license, and fulfill our other qualifications.',
            ),
            _buildSection(
              '3. Prohibited Uses',
              'The Vehicle shall not be used:\n• To carry persons or property for hire\n• To propel or tow any vehicle, trailer or other object\n• In any race, speed test or contest\n• By any person who is under the influence of alcohol or drugs\n• For any illegal purpose',
            ),
            _buildSection(
              '4. Fuel Policy',
              'You must return the Vehicle with the same amount of fuel as when it was provided to you. If you return the Vehicle with less fuel, you will be charged for the missing fuel at our current per-gallon rate plus a refueling service charge.',
            ),
            _buildSection(
              '5. Mileage Limitations',
              'Unless otherwise specified in your reservation, the Vehicle includes a daily mileage allowance of 200 miles. Excess mileage will be charged at \$0.50 per mile.',
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Text(content, style: AppTypography.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
