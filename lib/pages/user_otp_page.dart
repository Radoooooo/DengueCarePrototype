import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:prototype_denguecare/pages/user_home_page.dart';

class UserOtpPage extends StatefulWidget {
  const UserOtpPage({super.key});

  @override
  State<UserOtpPage> createState() => _UserOtpPageState();
}

class _UserOtpPageState extends State<UserOtpPage> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone number'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/otpimg.png'),
            const SizedBox(height: 16),
            const Text(
              'A code is sent to (+63) 915-123-4212',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40.0),
            OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 30,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 24),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                onChanged: (pin) {
                  print("Changed: $pin");
                },
                onCompleted: (pin) {
                  print("Completed: $pin");
                }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive a code?"),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Request again.",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserHomePage()),
                    (route) => false);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
