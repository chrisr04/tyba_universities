import 'package:flutter/material.dart';

class TabBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const TabBarDefault({
    super.key,
    required this.title,
    required this.tabs,
    this.onTap,
  });

  final String title;
  final List<String> tabs;
  final ValueChanged<int>? onTap;

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.zero,
        padding: const EdgeInsets.all(2.0),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        onTap: onTap,
        tabs: tabs
            .map(
              (tab) => Tab(
                child: Align(alignment: Alignment.center, child: Text(tab)),
              ),
            )
            .toList(),
      ),
    );
  }
}
