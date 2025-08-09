import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageMargin(
      showBottomNav: false,
      child: const Center(
        child: Text('Home'),
      ),
    );
  }
}
