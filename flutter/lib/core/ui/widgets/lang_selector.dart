import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../managers/app_cubit.dart';

class LangSelector extends StatelessWidget {
  const LangSelector({super.key});

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
