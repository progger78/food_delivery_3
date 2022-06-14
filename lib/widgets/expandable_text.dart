import 'package:flutter/material.dart';
import 'package:food_delivery_3/utils/utils.dart';
import 'package:food_delivery_3/widgets/app_small_text.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  var textHight = Dimensions.height55 * 2;

  @override
  void initState() {
    if (widget.text.length > textHight) {
      firstHalf = widget.text.substring(0, textHight.toInt());
      secondHalf =
          widget.text.substring(textHight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? AppSmallText(text: firstHalf)
          : Column(
              children: [
                AppSmallText(
                    text: hiddenText
                        ? ('$firstHalf...')
                        : (firstHalf + secondHalf)),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        hiddenText = !hiddenText;
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppSmallText(
                        text: hiddenText ? ('Show More') : ('Show Less'),
                        color: AppColors.mainColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Dimensions.height5 - 1),
                        child: Icon(
                          (hiddenText ? Icons.expand_more : Icons.expand_less),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
