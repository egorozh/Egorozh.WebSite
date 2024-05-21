import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';
import '../../../../router/router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    // const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: DesktopAppBar(currentLocation: widget.location),
              pinned: true,
            ),
          ],
          body: widget.child,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedLabelStyle: labelStyle,
      //   unselectedLabelStyle: labelStyle,
      //   selectedItemColor: const Color(0xFF434343),
      //   selectedFontSize: 12,
      //   unselectedItemColor: const Color(0xFF838383),
      //   showUnselectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (int index) {
      //     _goOtherTab(context, index);
      //   },
      //   currentIndex: widget.location == '/'
      //       ? 0
      //       : widget.location == contactsRoute
      //           ? 1
      //           : widget.location == blogRoute
      //               ? 2
      //               : 3,
      //   items: tabs,
      // ),
    );
  }
}

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({
    super.key,
    required this.currentLocation,
  });

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(child: Text(context.appTexts.about), onPressed: () => currentLocation == "/" ? null : context.go('/')),
        TextButton(child: Text(context.appTexts.projects), onPressed: () {}),
        TextButton(child: Text(context.appTexts.blog), onPressed: () => currentLocation == blogRoute ? null : context.go(blogRoute)),
        TextButton(
            child: Text(context.appTexts.contacts), onPressed: () => currentLocation == contactsRoute ? null : context.go(contactsRoute)),
        TextButton.icon(
          label: Text(context.appTexts.youtube),
          icon: SvgPicture.asset(
            Assets.icons.youtube,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
          onPressed: () {
            UrlHelper.open(myYoutubeChannelUrl);
          },
        ),
        TextButton.icon(
          label: Text(context.appTexts.github),
          icon: SvgPicture.asset(
            Assets.icons.github,
            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
          onPressed: () {
            UrlHelper.open(myGithubUrl);
          },
        ),
      ],
    );
  }
}
