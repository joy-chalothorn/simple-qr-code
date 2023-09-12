import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myqrcode/page/register_page.dart';
import 'package:myqrcode/style/button_style.dart';
import 'package:myqrcode/style/text_style.dart';
import '../style/field_container.dart';
import 'package:myqrcode/page/qrcode_page.dart';
import 'package:myqrcode/style/bg_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* login controller */
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   /* user log-in method*/
  void userLogIn(BuildContext context) {
    final String username = userNameController.text;
    final String password = passwordController.text;

    print('Username: $username');
    print('Password: $password');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QRCodePage(
          username: username,
          userNameController: userNameController,
          passwordController: passwordController,
        ),
      ),
    );
  }

  /* Dispose controllers when no longer needed */
  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /* automatic resizing to avoid the bottom inset */
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            /* sets width & height to be equal to the screen */
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: customGradientBG(),
            child: Column(
              children: [
                /* txtBtn สมัครสมาชิก */
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'สมัครสมาชิก',
                        style: customTextStyle2(fontSize: 16),
                      ),
                    ),
                  ],
                ),

                /* txt welcome */
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ยินดีต้อนรับ',
                          style: customTextStyle1(fontSize: 40),
                        ),
                        Text(
                          'เข้าสู่ระบบ',
                          style: customTextStyle1(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                /* TextField User and Password */
                FieldContainer(
                  labelText: 'User',
                  iconField: const Icon(
                    Icons.person,
                  ),
                  obscureText: false,
                  controller: userNameController,
                ),
                FieldContainer(
                  labelText: 'Password',
                  iconField: const Icon(
                    Icons.lock,
                  ),
                  obscureText: true,
                  controller: passwordController,
                ),

                /* txt ลืมรหัสผ่าน */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'ลืมรหัสผ่าน',
                          style: GoogleFonts.taviraj(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                /* customBtn ลงชื่อเข้าใช้ */
                ButtonElevated(
                    onTap: () {
                      userLogIn(context);
                    },
                    txt: 'ลงชื่อเข้าใช้'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
