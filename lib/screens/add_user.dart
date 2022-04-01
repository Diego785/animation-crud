import 'package:animation_model/widgets/button_widget.dart';
import 'package:animation_model/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/adduser1.jpg"),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.green.shade300,
                ),
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  textController: nameController,
                  hintText: "User Name",
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "User Details",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                    backgroundColor: Colors.green.shade700,
                    text: "Add",
                    textColor: Colors.white)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
          ],
        ),
      ),
    );
  }
}
