import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();

}

class _AccountsViewState extends State<AccountsView> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageMargin(
      showBottomNav: false,
      child: const Center(
        child: Text('Accounts'),
      ),
    );
  }
}
