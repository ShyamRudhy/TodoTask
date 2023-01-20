import 'package:flutter/material.dart';
import 'package:projects/common/colors.dart';
import 'package:projects/common/dimensions.dart';

class DefaultCircularLoadingIndicator extends StatelessWidget {

  const DefaultCircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,color: ACCENT_COLOR,
          ),
        ));
  }
}
