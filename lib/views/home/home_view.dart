import 'package:chef_buddy/views/home/mobile_view.dart';
import 'package:chef_buddy/views/home/web_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileHomeView();
        } else {
          return const WebHomeView();
        }
      },
    );
  }
}
