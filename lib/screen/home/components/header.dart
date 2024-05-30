import 'package:flutter/material.dart';
import 'package:projectflutter/model.dart/responsive.dart';

import '../../../constants.dart';
import 'menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        Text(
          " فـرص اليمن",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: kSecondaryColor),
        ),
        Spacer(),
        //menu
        //  if (Responsive.isMobile(context))
        HeaderWebMenu(),
        Spacer(),
        Expanded(
            child: Container(
          height: 50,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.3))),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        )),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: kSecondaryColor, borderRadius: BorderRadius.circular(8.0)),
          child: Icon(Icons.join_full_rounded),
        )
      ],
    );
  }
} //IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
  //if (Responsive.isDesktop(context))