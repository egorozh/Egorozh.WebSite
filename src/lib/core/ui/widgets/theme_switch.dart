import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/assets.gen.dart';
import '../../core.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        const lightColor = Color(0xFFFFFFFF);
        const darkColor = Color(0xFF27536B);

        return Switch(
          inactiveThumbColor: lightColor,
          inactiveTrackColor: lightColor,
          activeTrackColor: darkColor,
          activeColor: darkColor,
          activeThumbImage: Assets.icons.moon.provider(),
          inactiveThumbImage: Assets.icons.sun.provider(),
          value: state.themeMode == ThemeMode.dark,
          onChanged: (isChecked) {
            context.read<AppCubit>().changeTheme(isChecked ? ThemeMode.dark : ThemeMode.light);
          },
        );
      },
    );
  }
}
