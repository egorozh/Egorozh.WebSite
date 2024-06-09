import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/assets.gen.dart';
import '../../core.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        const lightColor = Color(0xFFF0F0F0);
        const darkColor = Color(0xFF0052B4);

        return Switch(
          inactiveThumbColor: lightColor,
          inactiveTrackColor: lightColor,
          activeTrackColor: darkColor,
          activeColor: darkColor,
          activeThumbImage: Assets.icons.uk.provider(),
          inactiveThumbImage: Assets.icons.russia.provider(),
          value: state.locale == AppCubit.englishLocale,
          onChanged: (isChecked) {
            final locale = isChecked ? AppCubit.englishLocale : AppCubit.russianLocale;

            context.read<AppCubit>().changeLanguage(locale);
          },
        );
      },
    );
  }
}
