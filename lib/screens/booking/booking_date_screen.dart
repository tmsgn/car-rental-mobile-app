import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../core/routes/app_routes.dart';
import '../../models/vehicle_model.dart';
import '../../widgets/buttons/app_buttons.dart';

class BookingDateScreen extends StatefulWidget {
  final Vehicle vehicle;

  const BookingDateScreen({super.key, required this.vehicle});

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTime? _startDate = DateTime.now().add(const Duration(days: 1));
  DateTime? _endDate = DateTime.now().add(const Duration(days: 3));
  TimeOfDay? _startTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay? _endTime = const TimeOfDay(hour: 10, minute: 0);

  final DateFormat _dateFormatter = DateFormat('EEE, MMM d, yyyy');

  void _selectDateRange() async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now().add(const Duration(days: 1)),
      end: DateTime.now().add(const Duration(days: 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: initialDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDateRange != null) {
      setState(() {
        _startDate = newDateRange.start;
        _endDate = newDateRange.end;
      });
    }
  }

  void _selectTime(bool isStart) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (newTime != null) {
      setState(() {
        if (isStart) {
          _startTime = newTime;
        } else {
          _endTime = newTime;
        }
      });
    }
  }

  bool get _canProceed => _startDate != null && _endDate != null && _startTime != null && _endTime != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Select Dates'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildVehicleSummary(),
                    const SizedBox(height: AppSpacing.xxl),
                    Text('Trip Dates', style: AppTypography.textTheme.headlineMedium),
                    const SizedBox(height: AppSpacing.md),
                    _buildDateSelector(),
                    const SizedBox(height: AppSpacing.xxl),
                    Text('Pickup & Return Time', style: AppTypography.textTheme.headlineMedium),
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(child: _buildTimeSelector(true)),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(child: _buildTimeSelector(false)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildLocationInfo(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleSummary() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            child: Image.network(
              widget.vehicle.imageUrls.first,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.vehicle.fullName, style: AppTypography.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text('\$${widget.vehicle.pricePerDay.toInt()} / day', style: AppTypography.textTheme.bodyMedium?.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return InkWell(
      onTap: _selectDateRange,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            const Icon(LucideIcons.calendar, color: AppColors.primary),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _startDate == null ? 'Select Dates' : '${_dateFormatter.format(_startDate!)} - ${_dateFormatter.format(_endDate!)}',
                    style: AppTypography.textTheme.titleLarge,
                  ),
                  if (_startDate != null) ...[
                    const SizedBox(height: 4),
                    Text('${_endDate!.difference(_startDate!).inDays} days total', style: AppTypography.textTheme.bodySmall),
                  ]
                ],
              ),
            ),
            const Icon(LucideIcons.chevronRight, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector(bool isStart) {
    final time = isStart ? _startTime : _endTime;
    return InkWell(
      onTap: () => _selectTime(isStart),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isStart ? 'Pickup Time' : 'Return Time', style: AppTypography.textTheme.bodySmall),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(LucideIcons.clock, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Text(time?.format(context) ?? '10:00 AM', style: AppTypography.textTheme.titleMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pickup & Return Location', style: AppTypography.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: const Icon(LucideIcons.mapPin, color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.vehicle.location, style: AppTypography.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text('Exact address provided after booking', style: AppTypography.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: PrimaryButton(
        text: 'Continue to Checkout',
        onPressed: _canProceed ? () {
          context.push(AppRoutes.bookingSummary, extra: widget.vehicle);
        } : null,
      ),
    );
  }
}
