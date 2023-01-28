// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:birmbhenawa/presentation/widgets/common/snackbars/simple_snackbar_content_type.dart';

import '../../../presentation/widgets/index.dart';

void showSnackbar(
  BuildContext context, {
  Color? color,
  required String title,
  required SimpleSnackbarContentType contentType,
}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: SimpleSnackbarContent(
            title: title,
            contentType: contentType,
          )),
    );
}
