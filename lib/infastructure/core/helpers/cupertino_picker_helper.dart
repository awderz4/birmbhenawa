// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';

Future showCupertinoPicker(BuildContext context, {required Widget child}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [child],
    ),
  );
}
