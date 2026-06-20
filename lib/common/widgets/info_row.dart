import 'package:flutter/widgets.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8.0,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Flexible(child: Text(value)),
      ],
    );
  }
}
