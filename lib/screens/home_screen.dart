import 'package:animation_model/screens/add_user.dart';
import 'package:animation_model/screens/all_users.dart';
import 'package:animation_model/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Terminal Bimodal",
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nSanta Cruz de la Sierra",
                    style: TextStyle(
                      color: Colors.green.shade500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            InkWell(
              onTap: () {
                Get.to(() => AddUser(),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  backgroundColor: Colors.green.shade700,
                  text: "Add User",
                  textColor: Colors.white),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(() => AllUsers(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                  backgroundColor: Colors.white,
                  text: "View All",
                  textColor: Colors.green.shade400),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/portada.jpg"),
          ),
        ),
      ),
    );
  }
}
