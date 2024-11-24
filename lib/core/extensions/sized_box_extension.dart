import 'package:flutter/material.dart';

extension SizedBoxExtensions on num {
  SizedBox heightSpace() => SizedBox(
    height: double.parse(toString()),
  );

  SizedBox widthSpace() => SizedBox(
    width: double.parse(toString()),
  );
}
