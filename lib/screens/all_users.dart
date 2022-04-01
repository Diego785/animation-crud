import 'dart:math';

import 'package:animation_model/widgets/button_widget.dart';
import 'package:animation_model/widgets/user_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try smarter"];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(255, 94, 102, 168).withOpacity(0.5),
      child: const Icon(Icons.edit, color: Colors.white),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.red,
      child: const Icon(Icons.delete, color: Colors.white),
      alignment: Alignment.centerRight,
    );

    return _isLoading
        ? LoadingPage()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.green.shade300,
                    ),
                  ),
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 3.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/adduser1.jpg"),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.green.shade300,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            color: Colors.black),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.calendar_today_sharp,
                        color: Colors.green.shade300,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20, color: Colors.green.shade300),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: myData.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: leftEditIcon,
                          secondaryBackground: rightDeleteIcon,
                          onDismissed: (DismissDirection direction) {
                            print("after dismiss");
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      height: 550,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2e3253)
                                            .withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ButtonWidget(
                                                backgroundColor:
                                                    Colors.green.shade700,
                                                text: "View",
                                                textColor: Colors.white),
                                            SizedBox(height: 20),
                                            ButtonWidget(
                                                backgroundColor:
                                                    Colors.green.shade700,
                                                text: "Edit",
                                                textColor: Colors.white),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                              return false;
                            } else {
                              setState(() => _isLoading = true);
                              await Future.delayed(
                                  Duration(seconds: 2),
                                  () =>
                                      direction == DismissDirection.endToStart);
                              setState(() => _isLoading = false);

                              return true;
                            }
                          },
                          key: ObjectKey(index),
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: UserWidget(
                              text: myData[index],
                              color: Colors.green,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Center(
        child: SpinKitCircle(
          size: 140,
          duration: const Duration(seconds: 2),
          color: Colors.white,
        ),
      ),
    );
  }
}

class Spinkit extends StatefulWidget {
  Spinkit({Key? key}) : super(key: key);

  @override
  State<Spinkit> createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) => _isLoading
      ? const LoadingPage()
      : Scaffold(
          appBar: AppBar(
            title: const Text("Spinkit"),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text("Load Data"),
              onPressed: () async {
                setState(() => _isLoading = true);
                await Future.delayed(
                  const Duration(seconds: 2),
                );
                setState(() => _isLoading = false);
              },
            ),
          ),
        );
}
