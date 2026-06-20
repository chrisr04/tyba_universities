import 'package:flutter/material.dart';

class HorizontalItemCard extends StatelessWidget {
  const HorizontalItemCard({
    super.key,
    required this.title,
    required this.circleIcon,
    required this.onTap,
  });

  final String title;
  final IconData circleIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            padding: EdgeInsets.all(8.0),
            child: Icon(circleIcon, color: Theme.of(context).primaryColor),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
