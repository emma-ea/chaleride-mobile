import 'package:chaleride/core/presentation/layout/page_margin.dart';
import 'package:flutter/material.dart';

class RidesView extends StatelessWidget {
  const RidesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageMargin(
      showBottomNav: false,
      child: Center(
        child: Text('Rides'),
      ),
    );
  }
}
