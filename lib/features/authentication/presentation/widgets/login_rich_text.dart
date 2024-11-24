import 'package:flutter/material.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/app_widget/app_text.dart';

class LoginRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function()? onTapSecondText;

  const LoginRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTapSecondText,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        AppText(
          text: firstText,
          fontSize: 16,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        2.widthSpace(),
        InkWell(
          onTap: onTapSecondText,
          child: AppText(
            text: secondText,
            fontSize: 16,
            color: onTapSecondText != null
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyMedium!.color,
            isUnderline: onTapSecondText != null,
            isLineThrough: onTapSecondText == null,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
    // return RichText(
    //   textAlign: TextAlign.center,
    //   text: TextSpan(
    //     children: [
    //       WidgetSpan(
    //         child: GestureDetector(
    //           child: AppText(
    //             text: firstText,
    //             fontSize: 16,
    //             color: Theme.of(context).textTheme.bodyLarge!.color,
    //           ),
    //         ),
    //       ),
    //       WidgetSpan(
    //         child: InkWell(
    //             onTap: onTapSecondText,
    //             child: AppText(
    //               text: secondText,
    //               fontSize: 16,
    //               color: onTapSecondText != null
    //                   ? Theme.of(context).primaryColor
    //                   : Theme.of(context).textTheme.bodyMedium!.color,
    //               isUnderline: onTapSecondText != null,
    //               isLineThrough: onTapSecondText == null,
    //               fontWeight: FontWeight.w800,
    //             ),
    //         ),
    //       ),
    //       if(thirdWidget != null)
    //         WidgetSpan(
    //           child: GestureDetector(
    //             child: thirdWidget,
    //           ),
    //         ),
    //     ],
    //   ),
    // );
  }
}
