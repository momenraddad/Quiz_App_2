import 'package:flutter/material.dart';
import 'package:quiz_app/Lists/informationforq.dart';
import 'package:quiz_app/screen/Endscreen.dart';

int score = 0; // score of  user
bool show = false; // if user end the quiz or not
bool click =
    false; // This variable shows whether the user chose an answer or not
int? select; // It takes the index of the answer chosen by the user
int colorofprossess = 0; //This variable expresses the state of the process
int index = 0; // this index for qu
int? green;
void rest() {
  show = false;
  index = 0;
  green = null;
  score = 0;
  select = null;
  click = false;
}

class Quizpage extends StatefulWidget {
  Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, dynamic> oneq = te[index];
    colorofprossess = index + 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment:
              show == true ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show == false) ...{
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    IconButton(
                      padding: EdgeInsets.only(right: 15),
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 20,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    QuW(oneq: oneq),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Text(
                      "Answer and get points ",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    processcounter(index: index, length: te.length),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              colorprocess(
                colorpro: colorofprossess,
                size: size, // size of devics
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    if (show != true) ...{
                      for (int i = 0; i < 3; i++) ...{
                        InkWell(
                          onTap: () {
                            setState(() {
                              green = i;
                              click = true;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding:
                                EdgeInsets.only(left: 15, top: 12, bottom: 5),
                            height: size.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black26),
                                color:
                                    green == i ? Colors.green : Colors.white),
                            child: Row(children: [
                              if (!(oneq['icon'][0] == 'null')) ...{
                                Container(
                                  child: Image(
                                      width: 50,
                                      height: 50,
                                      image: AssetImage(oneq['icon'][i])),
                                ),
                              },
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                oneq['AN'][i],
                                style: TextStyle(
                                    color: green != i
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                          ),
                        )
                      },
                      SizedBox(
                        height: size.height * 0.12,
                      ),
                      Container(
                          width: double.infinity,
                          height: size.height * 0.07,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                primary: Colors.black, // Background color
                              ),
                              onPressed: () {
                                setState(() {
                                  select = green;
                                  if (index < te.length - 1 && click == true) {
                                    index++;
                                    click = false;

                                    if (oneq['AN'][select] == oneq['Can'])
                                      score++;
                                    green = null;
                                    print(score);
                                  } else if (index == te.length - 1 &&
                                      click == true) {
                                    if (oneq['AN'][select] == oneq['Can'])
                                      score++;
                                    print(score);
                                    show = true;
                                  } else if (click == false) {
                                    final snackBar = SnackBar(
                                      content:
                                          const Text('Please select an answer'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                });
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              ))),
                    },
                  ],
                ),
              )
            } else ...{
              Endpage(numberofq: te.length)
              // Center(
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Text(
              //           "your score " +
              //               score.toString() +
              //               "/" +
              //               te.length.toString(),
              //           style: TextStyle(
              //               color: Colors.green,
              //               fontSize: 28,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         TextButton(
              //             onPressed: () {
              //               setState(() {
              //                 rest();
              //               });
              //             },
              //             child: Text(
              //               "rest quiz ",
              //               style: TextStyle(color: Colors.green),
              //             )),
              //       ]),
              // )
            }
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class QuW extends StatelessWidget {
  QuW({required this.oneq, super.key});
  Map<String, dynamic> oneq;

  @override
  Widget build(BuildContext context) {
    return Text(
      oneq['Qu'],
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    );
  }
}

// ignore: must_be_immutable
class processcounter extends StatelessWidget {
  processcounter({required this.index, required this.length, super.key});
  int? index;
  int? length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          " Step " + (index! + 1).toString(),
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(" of " + length.toString(),
            style: TextStyle(
              color: Colors.black26,
              fontSize: 16,
            ))
      ],
    );
  }
}

// ignore: must_be_immutable
class colorprocess extends StatelessWidget {
  colorprocess({required this.colorpro, required this.size, super.key});
  int colorpro;
  final size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++) ...{
          if (i < colorpro) ...{
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              height: 2.4,
              width: size.width / 5,
            ),
          } else
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              height: 2.4,
              width: size.width / 5,
            ),
        }
      ],
    );
  }
}
