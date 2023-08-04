import 'package:flutter/material.dart';
import 'package:quiz_app/screen/Homescreen.dart';
import 'package:quiz_app/screen/quizScreen.dart';

class Endpage extends StatefulWidget {
  Endpage({required this.numberofq, super.key});
  int? numberofq;

  @override
  State<Endpage> createState() => _EndpageState(num: numberofq);
}

class _EndpageState extends State<Endpage> {
  _EndpageState({required this.num});

  int? num;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "your score " + score.toString() + "/" + num.toString(),
          style: TextStyle(
              color: Colors.green, fontSize: 28, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 80,
          height: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(120),
              ),
              primary: Color.fromARGB(255, 105, 188, 107), // Background color
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Quizpage()));
              rest();
            },
            child: Image(

                //width: 300,
                // height: 300,
                image: AssetImage("assets/images/rest.png")),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Home Page ",
          style: TextStyle(
              color: Colors.green, fontSize: 28, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 80,
          height: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(120),
              ),
              primary: Color.fromARGB(255, 105, 188, 107), // Background color
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
              // Navigator.pop(context);
              rest();
            },
            child: Image(

                //width: 300,
                // height: 300,
                image: AssetImage("assets/images/Homei.png")),
          ),
        )
      ],
    ));
  }
}
