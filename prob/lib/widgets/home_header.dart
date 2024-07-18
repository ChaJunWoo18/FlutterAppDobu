import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isHome = ModalRoute.of(context)?.settings.name == '/';
    return Container(
      //color: const Color(0xffFEBBCC),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isHome
                  ? Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    )
                  : IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                      ),
                    ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.menu_rounded,
              //     size: 45,
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
