import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myqrcode/page/profile_detail.dart';
import 'package:myqrcode/style/bg_style.dart';
import 'package:myqrcode/style/button_style.dart';
import 'package:myqrcode/style/text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QRCodePage extends StatefulWidget {
  const QRCodePage({
    super.key,
    required this.username,
    required this.userNameController,
    required this.passwordController,
  });

  final String username;
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  /* QR Code Variable */
  final GlobalKey _globalKey = GlobalKey();
  dynamic externalDir = '/storage/emulated/0/Download';
  bool dirExist = false;

  /* QR Code Function */
  Future<void> _saveQRCode() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      /* check file name duplication */
      String fileName = 'QR_Code';
      int i = 1;
      while (await File('$externalDir/$fileName.png').exists()) {
        fileName = 'QR_Code_$i';
        i++;
      }
      /* check directory exist */
      dirExist = await File(externalDir).exists();
      /* if not then create the path */
      if (!dirExist) {
        await Directory(externalDir).create(recursive: true);
        dirExist = true;
      }

      /* path directory */
      final filePath = '$externalDir/$fileName.png';
      final file = File(filePath);
      print(file.path);
      await file.writeAsBytes(pngBytes);

      /* txt success save case */
      if (!mounted) return;
      const snakeBar = SnackBar(content: Text('บันทึกรูป QR Code แล้ว'));
      ScaffoldMessenger.of(context).showSnackBar(snakeBar);
    } catch (e) {
      /* txt fail save case */
      if (!mounted) return;
      const snakeBar =
          SnackBar(content: Text('ไม่สามารถบันทึกรูปได้ โปรดลองอีกครั้ง'));
      ScaffoldMessenger.of(context).showSnackBar(snakeBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    const String vcardData = 'ชื่อ-นามสกุล: ชโลธร ไชยมนตรี\n'
        'ชื่อเล่น: จอย\n'
        'เบอร์โทร: 099-000-1234;\n'
        'เลขสมาชิก: 00000001\n'
        'อีเมล: joy.xxxx@gmail.com\n'
        'จังหวัด: กรุงเทพ';

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: customGradientBG(),
            child: Column(
              children: [
                /* txtBtn ลงชื่อออก */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'ยินดีต้อนรับคุณ ${widget.username}',
                        style: customTextStyle2(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.userNameController.clear();
                        widget.passwordController.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'ลงชื่อออก',
                        style: customTextStyle2(fontSize: 16),
                      ),
                    ),
                  ],
                ),

                /* txt ข้อมูลส่วนบุคคล */
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Column(
                    children: [
                      Text(
                        'โปรไฟล์',
                        style: customTextStyle2(fontWeight: FontWeight.w600, fontSize: 28),
                      ),
                      const SizedBox(height: 20),
                      const ProfileDetail(),
                    ],
                  ),
                ),

                /* QR Code */
                RepaintBoundary(
                  key: _globalKey,
                  child: QrImageView(
                    data: vcardData,
                    version: QrVersions.auto,
                    size: 200,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(height: 40),

                /* Btn บันทึก */
                ButtonElevated(
                  onTap: _saveQRCode,
                  txt: 'บันทึก',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
