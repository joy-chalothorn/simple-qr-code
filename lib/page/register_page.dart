import 'package:flutter/material.dart';
import 'package:myqrcode/style/button_style.dart';
import 'package:myqrcode/style/field_container.dart';
import 'package:myqrcode/style/text_style.dart';
import '../style/bg_style.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  /* register controller */
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cfPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: customGradientBG(),
            child: Column(
              children: [
                /* txtBtn เข้าสู่ระบบ */
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: customTextStyle2(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                /* txt ลงทะเบียน */
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 100),
                    child: Column(
                      children: [
                        Text(
                          'ลงทะเบียน',
                          style: customTextStyle1(),
                        ),
                        Text(
                          'โปรดกรอกข้อมูลด้านล่าง',
                          style: customTextStyle1(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                /* TextField Register */
                FieldContainer(
                    labelText: 'User',
                    iconField: const Icon(Icons.person),
                    obscureText: false,
                    controller: userNameController),
                const SizedBox(height: 7),
                FieldContainer(
                    labelText: 'Password',
                    iconField: const Icon(Icons.lock),
                    obscureText: true,
                    controller: passwordController),
                const SizedBox(height: 7),
                FieldContainer(
                    labelText: ('Confirm Password'),
                    iconField: const Icon(Icons.lock),
                    obscureText: false,
                    controller: cfPasswordController),

                const SizedBox(height: 50),

                /* customBtn ตกลง */
                ButtonElevated(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    txt: 'ยืนยัน'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
