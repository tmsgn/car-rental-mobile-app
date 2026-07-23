import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../buttons/app_buttons.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double _minPrice = 50;
  double _maxPrice = 300;
  String _selectedTransmission = 'Any';
  int _selectedSeats = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusXl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filters', style: AppTypography.textTheme.headlineMedium),
              TextButton(
                onPressed: () {
                  setState(() {
                    _minPrice = 50;
                    _maxPrice = 300;
                    _selectedTransmission = 'Any';
                    _selectedSeats = 4;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          
          Text('Price Range (per day)', style: AppTypography.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 20,
            max: 1000,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.border,
            labels: RangeLabels('\$${_minPrice.toInt()}', '\$${_maxPrice.toInt()}'),
            onChanged: (values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${_minPrice.toInt()}', style: AppTypography.textTheme.bodyMedium),
              Text('\$${_maxPrice.toInt()}', style: AppTypography.textTheme.bodyMedium),
            ],
          ),
          
          const SizedBox(height: AppSpacing.xxl),
          Text('Transmission', style: AppTypography.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _buildChoiceChip('Any', _selectedTransmission == 'Any', () => setState(() => _selectedTransmission = 'Any')),
              const SizedBox(width: AppSpacing.sm),
              _buildChoiceChip('Automatic', _selectedTransmission == 'Automatic', () => setState(() => _selectedTransmission = 'Automatic')),
              const SizedBox(width: AppSpacing.sm),
              _buildChoiceChip('Manual', _selectedTransmission == 'Manual', () => setState(() => _selectedTransmission = 'Manual')),
            ],
          ),
          
          const SizedBox(height: AppSpacing.xxl),
          Text('Seats', style: AppTypography.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _buildChoiceChip('2+', _selectedSeats == 2, () => setState(() => _selectedSeats = 2)),
              const SizedBox(width: AppSpacing.sm),
              _buildChoiceChip('4+', _selectedSeats == 4, () => setState(() => _selectedSeats = 4)),
              const SizedBox(width: AppSpacing.sm),
              _buildChoiceChip('5+', _selectedSeats == 5, () => setState(() => _selectedSeats = 5)),
              const SizedBox(width: AppSpacing.sm),
              _buildChoiceChip('7+', _selectedSeats == 7, () => setState(() => _selectedSeats = 7)),
            ],
          ),
          
          const SizedBox(height: AppSpacing.xxxl),
          PrimaryButton(
            text: 'Apply Filters',
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: AppSpacing.md), // SafeArea bottom padding
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
        ),
        child: Text(
          label,
          style: AppTypography.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
