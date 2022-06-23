import 'package:flutter/material.dart';

import '../Model/Moeda.dart';

class InfoModal {
  //https://gitlab.com/coinswalletbr/coins-flutter-mobile-test/-/tree/main
  modal(BuildContext context, String simbolo, String fee, String sobre) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          MediaQueryData query = MediaQuery.of(context);
          return SizedBox(
            width: 100,
            height: 200,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: query.size.width,
                      height: 25,
                      child: RaisedButton(
                        color: Colors.black,
                        elevation: 2,
                        focusElevation: 4,
                        hoverElevation: 4,
                        highlightElevation: 8,
                        disabledElevation: 1,
                        onPressed: () {},
                        child: Text(
                          simbolo,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  color: Colors.green,
                  width: query.size.width,
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //const Padding(padding: EdgeInsets.only(left: 22)),
                      Text(
                        "Fee: " + fee.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                // const  Padding(padding: EdgeInsets.only(top: 1)),
                Container(
                  color: Colors.white,
                  width: query.size.width,
                  height: query.size.height - 629,
                  child: SingleChildScrollView(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //const Padding(padding: EdgeInsets.only(left: 22)),
                        const Padding(padding: EdgeInsets.only(left: 22)),
                         SingleChildScrollView(
                          
                           child: Text(
                              sobre,
                             style: const TextStyle(
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,
                                 fontStyle: FontStyle.italic),
                           ),
                         ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
