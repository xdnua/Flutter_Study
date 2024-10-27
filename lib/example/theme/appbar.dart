import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarDemo extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAFAFA),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          child: SvgPicture.asset(
            'assets/images/instagram_logo.svg',
            width: 105,
            fit: BoxFit.fitWidth,
          ),
        ),
        leadingWidth: 36,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SvgPicture.asset(
            'assets/icons/camera.svg',
            width: 24,
            fit: BoxFit.fitWidth,
          ),
        ),
        actions: [
          SvgPicture.asset(
            'assets/icons/igtv.svg',
            width: 24,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            width: 18,
          ),
          SvgPicture.asset(
            'assets/icons/messenger.svg',
            width: 23,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            width: 12,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: const Color(0x1A000000),
              height: 1,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
