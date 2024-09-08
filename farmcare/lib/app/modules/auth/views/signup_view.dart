import 'package:farmcare/app/modules/auth/controllers/auth_controller.dart';
import 'package:farmcare/app/modules/auth/views/login_view.dart';
import 'package:farmcare/app/modules/auth/views/otp_verification_view.dart';
import 'package:farmcare/app/modules/user/views/profile_setup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../routes/app_pages.dart';

class SignupView extends GetView{
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return
      Scaffold(
        // backgroundColor: Color.fromRGBO(131, 207, 131, 1.0),
        body:  SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(margin:EdgeInsets.only(top: 50),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.red)),height: 80,width:80),
                SizedBox(height: 10,),
                Text("Sign up to get started"),
                SizedBox(height: 10,),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.3,width: MediaQuery.sizeOf(context).width*0.85 , child: Image(image: AssetImage("assets/images/phone.png"),fit: BoxFit.cover,)),
                SizedBox(height: 10,),
                Text("Enter your phone number",style: TextStyle(fontSize: 22)),
                Text("We will send you a  4-digit pin to your phone number ",style: TextStyle(fontSize: 11),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  height: 100,
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    languageCode: "en",
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                     controller.phone.value = phone.completeNumber;
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),
                SizedBox(width: 150,
                  child: ElevatedButton(onPressed: () {
                    controller.signup();
                  }, child: Text("Sign-up")),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.4,child: const Divider()),
                    const SizedBox(width: 10,),
                    const Text("OR"),
                    const SizedBox(width: 10,),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.4,child: const Divider()),
                  ],
                ),
                Text("Already have an account? "),
                TextButton(onPressed: () {
                  Get.offNamed(Routes.LOGIN);
                }, child: Text("Login")),
                ElevatedButton(onPressed: (){}, child: Text("Guide to this app")),
                SizedBox(width: MediaQuery.sizeOf(context).width*0.5,child: Divider(thickness: 5,))
              ],
            ),
          ),
        ),
      );
  }
}
