library expandable_text_plus;

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;
  final String readMoreText;
  final String readLessText;
  final TextStyle? linkStyle;

  const ExpandableText({
    Key? key,
    required this.text,
    this.maxLines = 2,
    this.textStyle,
    this.readMoreText = 'Read more',
    this.readLessText = 'Read less',
    this.linkStyle,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  bool showReadMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfTextOverflows();
    });
  }

  void _checkIfTextOverflows() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.textStyle),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32);

    if (textPainter.didExceedMaxLines) {
      setState(() {
        showReadMore = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: widget.textStyle ?? const TextStyle(fontSize: 14),
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        if (showReadMore)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                isExpanded ? widget.readLessText : widget.readMoreText,
                style: widget.linkStyle ??
                    const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
