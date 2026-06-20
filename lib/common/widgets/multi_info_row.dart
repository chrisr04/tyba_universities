import 'package:flutter/material.dart';

class MultiInfoRow extends StatelessWidget {
  const MultiInfoRow({
    super.key,
    required this.label,
    required this.values,
    this.onTap,
  });

  final String label;
  final List<String> values;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Column(
          children: values
              .map(
                (value) => InkWell(
                  onTap: () => onTap?.call(value),
                  child: Text(
                    value,
                    style: TextStyle(
                      decoration: onTap != null
                          ? TextDecoration.underline
                          : null,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
