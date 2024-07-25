import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound_of_memes/core/theme/pallate.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // pages[selectedIndex],
          Center(child: Text("Home Page"))
          // const Positioned(
          //   bottom: 0,
          //   child: MusicSlab(),
          // ),
        ],
      ),
    );
  }
}
