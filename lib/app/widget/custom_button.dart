import 'package:flutter/material.dart';

class Custom_button_Back extends StatelessWidget {
  Custom_button_Back({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        
      ),
      child: MaterialButton(
          padding: const EdgeInsets.only(right: 0.0),
          onPressed: onPressed,
          child: const Icon(Icons.keyboard_arrow_left,
              size: 35, color: Colors.black)),
    );
  }
}

class CustomButton extends StatelessWidget {
  String titleButton;
  IconData? icon;
  double? hightButton;
  double? widthButton;
  double radiusButton;
  double maginRight;
  double maginleft;
  Color? titlebuttonColor;
  Color? iconcolor;
  double? iconsize;
  Color? buttonColor;
  VoidCallback? onPressed;
  CustomButton(
      {Key? key,
        this.titleButton = "",
        this.icon,
        this.iconsize,
        this.onPressed,
        this.hightButton,
        this.widthButton,
        this.radiusButton = 0,
        this.maginRight = 0,
        this.maginleft = 0,
        this.buttonColor,
        this.iconcolor,
        this.titlebuttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthButton,
      margin: EdgeInsets.only(right: maginRight, left: maginleft),
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 24, 85, 171),
            ),
            borderRadius: BorderRadius.all(Radius.circular(radiusButton))),
        height: hightButton,
        color: buttonColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconcolor,
              size: iconsize,
            ),
            const SizedBox(
              width: 15,
            ),
            Center(
                child: Text(
                  titleButton,
                  style: TextStyle(color: titlebuttonColor, fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomButtontext extends StatelessWidget {
  String titleButton;
  double? hightButton;
  double? widthButton;
  double radiusButton;
  double maginRight;
  double maginleft;
  Color? titlebuttonColor;
  Color? buttonColor;
  VoidCallback? onPressed;
  CustomButtontext(
      {Key? key,
        this.titleButton = "",
        this.onPressed,
        this.hightButton,
        this.widthButton,
        this.radiusButton = 0,
        this.maginRight = 0,
        this.maginleft = 0,
        this.buttonColor,
        this.titlebuttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hightButton,
      width: widthButton,
      margin: EdgeInsets.only(right: maginRight, left: maginleft),
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radiusButton))),
        height: hightButton,
        color: buttonColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                  titleButton,
                  style: TextStyle(
                      color: titlebuttonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}
