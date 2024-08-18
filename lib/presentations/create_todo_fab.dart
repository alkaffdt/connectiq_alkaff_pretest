import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/styles/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTodoFAB extends ConsumerWidget {
  const CreateTodoFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.bluePrimary,
      icon: const Icon(
        Icons.add,
      ),
      label: const Text("Create a todo"),
      onPressed: () {},
    );
  }
}
