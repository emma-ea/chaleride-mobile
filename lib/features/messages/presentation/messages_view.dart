import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();

}

class _MessagesViewState extends State<MessagesView> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageMargin(
      showBottomNav: false,
      child: const Center(
        child: Text('Messages'),
      ),
    );
  }
}
