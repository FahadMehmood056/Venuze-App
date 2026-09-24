import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithAction extends StatefulWidget {
  final String text;
  final String actionLabel;
  final VoidCallback onActionTap;
  final TextAlign textAlign;

  const TextWithAction({
    super.key,
    required this.text,
    required this.actionLabel,
    required this.onActionTap,
    this.textAlign = TextAlign.start,
  });

  @override
  State<TextWithAction> createState() => _TextWithActionState();
}

class _TextWithActionState extends State<TextWithAction> {
  late final TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = () => widget.onActionTap();
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Text.rich(
      textAlign: widget.textAlign,
      TextSpan(
        text: widget.text,
        style: text.bodyMedium,
        children: [
          TextSpan(
            text: widget.actionLabel,
            style: text.labelMedium?.copyWith(color: colors.primary),
            recognizer: _recognizer,
          ),
        ],
      ),
    );
  }
}
