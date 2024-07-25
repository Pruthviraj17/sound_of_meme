import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound_of_memes/core/providers/current_user_notifier.dart';
import 'package:sound_of_memes/core/theme/theme.dart';
import 'package:sound_of_memes/features/auth/view/pages/login_page.dart';
import 'package:sound_of_memes/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:sound_of_memes/features/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authViewModelProvider.notifier).initSharedPreferences();
  await container.read(authViewModelProvider.notifier).getData();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return MaterialApp(
      title: 'SoundOfMeme',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: currentUser == null ? const LoginPage() : const HomePage(),
    );
  }
}
