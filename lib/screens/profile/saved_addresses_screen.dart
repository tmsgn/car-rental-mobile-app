import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../mock_data/mock_data.dart';


class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  late List<String> _addresses;

  @override
  void initState() {
    super.initState();
    _addresses = List.from(mockSavedAddresses);
  }

  void _addAddress() {
    // In a real app, this would open a place picker or form
    setState(() {
      _addresses.add('123 New Address St, City, ST 12345');
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Address added successfully'), backgroundColor: AppColors.success),
    );
  }

  void _deleteAddress(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Address'),
        content: const Text('Are you sure you want to remove this saved address?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              setState(() => _addresses.removeAt(index));
              Navigator.pop(ctx);
            },
            child: const Text('Remove', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Saved Addresses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addAddress,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(LucideIcons.plus),
        label: const Text('Add Address'),
      ),
      body: _addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(LucideIcons.mapPin, size: 64, color: AppColors.textTertiary),
                  const SizedBox(height: AppSpacing.md),
                  Text('No saved addresses', style: AppTypography.textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Add home or work addresses for faster checkout.', style: AppTypography.textTheme.bodyMedium),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.pagePadding),
              itemCount: _addresses.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                        ),
                        child: const Icon(LucideIcons.mapPin, color: AppColors.primary),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          _addresses[index],
                          style: AppTypography.textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(LucideIcons.trash2, size: 20, color: AppColors.error),
                        onPressed: () => _deleteAddress(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
