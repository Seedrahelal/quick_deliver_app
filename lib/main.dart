import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_deliver/cubit/user_cubit.dart';
import 'package:quick_deliver/screens/start_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const QuickDeliver());
}

class QuickDeliver extends StatelessWidget {
  const QuickDeliver({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    );
  }
}
