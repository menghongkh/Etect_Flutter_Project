import 'package:flutter/material.dart';

class Favoriteicon extends StatefulWidget {
  const Favoriteicon({Key? key}) : super(key: key);

  @override
  State<Favoriteicon> createState() => _FavoriteiconState();
}

class _FavoriteiconState extends State<Favoriteicon> {
  bool setClick = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (setClick == true) {
            setClick = false;
          } else {
            setClick = true;
          }
        });
      },
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
              color: (setClick)
                  ? const Color.fromARGB(255, 0, 77, 154)
                  : Colors.white,
              boxShadow: const [BoxShadow(blurStyle: BlurStyle.normal)]),
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            Icons.favorite_border_rounded,
            color: (setClick)
                ? Colors.white
                : const Color.fromARGB(255, 0, 77, 154),
          )),
    );
  }
}
