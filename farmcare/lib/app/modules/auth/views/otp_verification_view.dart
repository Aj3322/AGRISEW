import 'package:farmcare/app/modules/auth/views/signup_view.dart';
import 'package:farmcare/app/views/views/location_access_view.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> with CodeAutoFill {
  String _otpCode = "";

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void codeUpdated() {
    setState(() {
      _otpCode = code!;
    });
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }
  String section = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 230,width: 230,child:Image.asset("assets/images/img.png"),),
              SizedBox(height: 30,),
              const Text(
                'Enter the OTP sent to your phone',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {
                  setState(() {
                    _otpCode = value;
                  });
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.white30
                ),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: _otpCode),
                onCompleted: (value) {
                  // Handle OTP verification here
                  print("OTP Entered: $value");
                },
              ),
              const SizedBox(height: 20),
              Text("You will recieve OTP within 04:50 min"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Didn’t recieve OTP ?",style: TextStyle(fontSize: 12,color: Colors.white54),),
                TextButton(onPressed: () {
          
                }, child: Text('Resend OTP'))
              ],),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.04,),
              ElevatedButton(
                onPressed: () {
                  // Call your OTP verification logic here
                 Get.put(AuthController()).verifyOtp(_otpCode,"signup");
                  print("Verifying OTP: $_otpCode");
                },
                child: const Text('Verify OTP'),
              ),
              const SizedBox(height: 130,),
              SizedBox(width: MediaQuery.sizeOf(context).width*0.5,child: const Divider(thickness: 5,))
            ],
          ),
        ),
      ),
    );
  }
}
