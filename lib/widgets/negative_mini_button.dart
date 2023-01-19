import 'package:projects/common/colors.dart';
import 'package:projects/common/dimensions.dart';
import 'package:flutter/material.dart';

class NegativeMiniButton extends StatefulWidget{

  final String buttonText;
  final VoidCallback onPressed;
  final Size size;

 const NegativeMiniButton({super.key, required this.buttonText,required this.onPressed,required this.size});

  @override
  _NegativeMiniButtonState createState()=> _NegativeMiniButtonState();
}

class _NegativeMiniButtonState extends State <NegativeMiniButton>{
  bool _hasBeenPressed = true;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: widget.size.width*0.3,
      onPressed: (){
        setState(() {
          _hasBeenPressed = !_hasBeenPressed;
        });
        widget.onPressed();
      },
      color:_hasBeenPressed ? BACKGROUND_COLOR :ACCENT_COLOR ,
      padding: const EdgeInsets.all(DEFAULT_BUTTON_PADDING),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DEFAULT_BUTTON_BORDER_RADIUS),
          side: const BorderSide(color: ACCENT_COLOR)
      ),
      child: Text(
        widget.buttonText,
        style: Theme.of(context)
            .textTheme
            .button
            ?.copyWith(fontSize: TEXT_LARGE_FONT_SIZE, color:_hasBeenPressed ? COLOR_GREY:PRIMARY_WHITE_COLOR ),
        textAlign: TextAlign.center,
      ),
    );
  }

}




