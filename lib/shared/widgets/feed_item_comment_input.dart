import 'package:flutter/material.dart';

class FeedItemCommentInput extends StatelessWidget {
  const FeedItemCommentInput({
    @required this.showCommentInput,
    Key key,
  }) : super(key: key);

  final bool showCommentInput;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          // child: SILFormTextField(
          //   suffixIcon: Icon(Icons.search, color: Colors.grey),
          //   context: context,
          //   hintText: 'comment',
          // ),
        ),
      ),
    );
  }
}
