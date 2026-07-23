enum TransactionType { payment, refund, deposit, fee }
enum TransactionStatus {
  pending,
  processing,
  successful,
  failed,
  refunded,
  partiallyRefunded,
  cancelled,
  depositHeld,
  depositReleased
}

class Transaction {
  final String id;
  final String bookingReference;
  final String vehicleName;
  final TransactionType type;
  final TransactionStatus status;
  final double amount;
  final DateTime date;
  final String paymentMethod;
  final String? invoiceUrl;

  const Transaction({
    required this.id,
    required this.bookingReference,
    required this.vehicleName,
    required this.type,
    required this.status,
    required this.amount,
    required this.date,
    required this.paymentMethod,
    this.invoiceUrl,
  });

  String get typeLabel {
    switch (type) {
      case TransactionType.payment:
        return 'Payment';
      case TransactionType.refund:
        return 'Refund';
      case TransactionType.deposit:
        return 'Security Deposit';
      case TransactionType.fee:
        return 'Service Fee';
    }
  }

  String get statusLabel {
    switch (status) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.successful:
        return 'Successful';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.refunded:
        return 'Refunded';
      case TransactionStatus.partiallyRefunded:
        return 'Partially Refunded';
      case TransactionStatus.cancelled:
        return 'Cancelled';
      case TransactionStatus.depositHeld:
        return 'Deposit Held';
      case TransactionStatus.depositReleased:
        return 'Deposit Released';
    }
  }
}
