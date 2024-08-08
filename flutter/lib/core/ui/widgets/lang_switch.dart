import 'package:egorozh_cv/features/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/assets.gen.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
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
          value: state.selectedLocale == state.supportedLocales![1],
          onChanged: (isChecked) {
            final locale = isChecked ? state.supportedLocales![1] : state.supportedLocales![0];

            context.read<LangCubit>().changeLanguage(locale);
          },
        );
      },
    );
  }
}
