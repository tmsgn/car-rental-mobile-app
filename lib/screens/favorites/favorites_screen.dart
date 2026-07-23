import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/cards/vehicle_card.dart';
import '../../mock_data/mock_data.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a mock list of favorite vehicles
    final favorites = mockVehicles.where((v) => v.isFeatured).take(6).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Saved Vehicles'),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No saved vehicles yet.'), // We could use EmptyStateWidget here
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.pagePadding),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return VehicleCard(
                  vehicle: favorites[index],
                  isHorizontal: true,
                  onTap: () {
                    context.push(AppRoutes.vehicleDetails, extra: favorites[index]);
                  },
                );
              },
            ),
    );
  }
}
