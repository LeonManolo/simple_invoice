import 'package:flutter/material.dart';

enum InvoiceStatus {
  Pending,
  Overdue,
  Paid,
}

class InvoiceStatusTag extends StatelessWidget {
  final InvoiceStatus status;

  const InvoiceStatusTag({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case InvoiceStatus.Paid:
        color = Colors.green;
        text = "Paid";
        break;
      case InvoiceStatus.Overdue:
        color = Colors.red;
        text = "Overdue";
        break;
      case InvoiceStatus.Pending:
        color = Colors.orange;
        text = "Pending";
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
