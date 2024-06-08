import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../localization.dart';
import '../../core.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.appTexts.dark_theme_label),
            const SizedBox(width: 8),
            Switch(
              value: state.themeMode == ThemeMode.dark,
              onChanged: (isChecked) {
                context.read<AppCubit>().changeTheme(isChecked ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ],
        );
      },
    );
  }
}
