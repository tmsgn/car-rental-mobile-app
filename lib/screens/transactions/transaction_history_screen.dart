import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../core/routes/app_routes.dart';
import '../../mock_data/mock_data.dart';
import '../../models/transaction_model.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Transaction History')),
      body: mockTransactions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(LucideIcons.receipt, size: 64, color: AppColors.textTertiary),
                  const SizedBox(height: AppSpacing.md),
                  Text('No transactions yet', style: AppTypography.textTheme.titleLarge),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.pagePadding),
              itemCount: mockTransactions.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final txn = mockTransactions[index];
                return _buildTransactionCard(context, txn);
              },
            ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, Transaction txn) {
    final dateFormat = DateFormat('MMM d, yyyy');
    
    IconData icon;
    Color iconColor;
    
    switch (txn.type) {
      case TransactionType.payment:
        icon = LucideIcons.arrowUpRight;
        iconColor = AppColors.error;
        break;
      case TransactionType.refund:
        icon = LucideIcons.arrowDownLeft;
        iconColor = AppColors.success;
        break;
      case TransactionType.deposit:
        icon = LucideIcons.shieldCheck;
        iconColor = AppColors.info;
        break;
      case TransactionType.fee:
        icon = LucideIcons.alertCircle;
        iconColor = AppColors.warning;
        break;
    }

    return InkWell(
      onTap: () => context.push(AppRoutes.invoiceDetail, extra: txn),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
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
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txn.vehicleName, style: AppTypography.textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text('${txn.typeLabel} • ${dateFormat.format(txn.date)}', style: AppTypography.textTheme.bodySmall),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${txn.type == TransactionType.refund ? '+' : '-'}\$${txn.amount.toStringAsFixed(2)}',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: txn.type == TransactionType.refund ? AppColors.success : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  txn.statusLabel,
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: txn.status == TransactionStatus.completed ? AppColors.success : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
