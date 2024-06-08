import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_cubit.dart';
import '../../../../core/core.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../localization.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //   onPressed: () => UrlHelper.open("tel:79818852110"),
            //   child: const Text("+7-981-885-21-10"),
            // ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => UrlHelper.open('mailto:$myEmail'),
              child: const Text(myEmail),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              label: Text(context.appTexts.youtube),
              icon: SvgPicture.asset(
                Assets.icons.youtube,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
              onPressed: () => UrlHelper.open(myYoutubeChannelUrl),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              label: Text(context.appTexts.github),
              icon: SvgPicture.asset(
                Assets.icons.github,
                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
              onPressed: () => UrlHelper.open(myGithubUrl),
            ),
            const SizedBox(height: 48),
            const _ThemeSwitch(),
            const SizedBox(height: 12),
            const _LangSelector(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _LangSelector extends StatelessWidget {
  const _LangSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: switch (state.locale.languageCode) {
            "ru" => "Русский",
            _ => "English",
          },
          onChanged: (String? value) {
            final code = switch (value) {
              "Русский" => "ru",
              _ => "en",
            };

            context.read<AppCubit>().changeLanguage(code);
          },
          items: const [
            DropdownMenuItem(
              value: "English",
              child: Text("English"),
            ),
            DropdownMenuItem(
              value: "Русский",
              child: Text("Русский"),
            ),
          ],
        );
      },
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch();

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
