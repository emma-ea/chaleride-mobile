import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:chaleride/features/accounts/presentation/accounts_view.dart';
import 'package:chaleride/features/home/presentation/home_view.dart';
import 'package:chaleride/features/messages/presentation/messages_view.dart';
import 'package:chaleride/features/rides/presentation/rides_view.dart';
import 'package:flutter/material.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {

  int _currentPage = 0;

  List<Widget> pages = const [
    HomeView(),
    RidesView(),
    MessagesView(),
    AccountsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageMargin(
      selectedIndex: _currentPage,
      onNavItemTap: (pageIndex) { setState(() { _currentPage = pageIndex; }); },
      child: pages[_currentPage],
    );
  }
}