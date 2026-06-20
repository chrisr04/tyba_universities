import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba_universities/common/widgets/error_message.dart';
import 'package:tyba_universities/common/widgets/horizontal_item_card.dart';
import 'package:tyba_universities/common/widgets/tab_bar_default.dart';
import 'package:tyba_universities/common/widgets/vertical_item_card.dart';
import 'package:tyba_universities/features/home/config/values/home_strings.dart';
import 'package:tyba_universities/features/home/domain/entities/university_entity.dart';
import 'package:tyba_universities/features/home/ui/view_model/home_view_model.dart';
import 'package:tyba_universities/features/university_detail/config/routes/detail_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel _viewModel = context.read<HomeViewModel>();

  @override
  void initState() {
    super.initState();

    Future.microtask(_viewModel.loadUniversities);
  }

  @override
  Widget build(BuildContext context) {
    final uiState = context.watch<HomeViewModel>().uiState;
    final appBar = AppBar(title: Text(HomeStrings.appBarTitle));
    const padding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

    if (uiState.isLoading) {
      return Scaffold(
        appBar: appBar,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final String? error = uiState.error;

    if (error != null) {
      return Scaffold(
        appBar: appBar,
        body: ErrorMessage(message: error),
      );
    }

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: TabBarDefault(
          title: HomeStrings.appBarTitle,
          tabs: [HomeStrings.listMode, HomeStrings.gridMode],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: padding,
              itemCount: uiState.universities.length,
              itemBuilder: (context, index) {
                final university = uiState.universities[index];
                return HorizontalItemCard(
                  title: university.name,
                  circleIcon: Icons.school_outlined,
                  onTap: () => _onItemTap(university),
                );
              },
            ),
            GridView.builder(
              padding: padding,
              itemCount: uiState.universities.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final university = uiState.universities[index];
                return VerticalItemCard(
                  title: university.name,
                  circleIcon: Icons.school_outlined,
                  onTap: () => _onItemTap(university),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTap(UniversityEntity university) {
    Navigator.of(context).pushNamed(
      UniversityDetailRoutes.universityDetailRoute,
      arguments: university,
    );
  }
}
