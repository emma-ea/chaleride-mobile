import 'package:chaleride/core/platform/app_colors.dart';
import 'package:chaleride/core/platform/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageMargin extends StatelessWidget {
  const PageMargin(
      {super.key,
      required this.child,
      this.selectedIndex = 0,
      this.showBottomNav = true,
      this.trailingActions = const [],
      this.onNavItemTap});

  final Widget child;
  final int selectedIndex;
  final ValueChanged<int>? onNavItemTap;
  final bool showBottomNav;
  final List<Widget> trailingActions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          minimum: const EdgeInsets.all(15),
          child: child,
        ),
        bottomNavigationBar: showBottomNav
            ? BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: showBottomNav ? onNavItemTap : null,
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: AppColors.darkGrey),
                unselectedLabelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: AppColors.grey),
                elevation: 3,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: SvgPicture.asset(AppImages.homeLine),
                    activeIcon: SvgPicture.asset(AppImages.homeSolid),
                  ),
                  BottomNavigationBarItem(
                    label: 'Rides',
                    icon: SvgPicture.asset(AppImages.rideLine),
                    activeIcon: SvgPicture.asset(AppImages.rideSolid),
                  ),
                  BottomNavigationBarItem(
                    label: 'Messages',
                    icon: SvgPicture.asset(
                      AppImages.messagesLine,
                    ),
                    activeIcon: SvgPicture.asset(AppImages.messagesSolid),
                  ),
                  BottomNavigationBarItem(
                    label: 'Account',
                    icon: SvgPicture.asset(
                      AppImages.accountLine,
                    ),
                    activeIcon: SvgPicture.asset(AppImages.accountSolid),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
