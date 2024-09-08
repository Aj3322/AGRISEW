import 'package:farmcare/app/modules/home/views/main_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LocationAccessView extends GetView {
  const LocationAccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Access'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20,),
            SizedBox(height: 250,width: double.infinity,child: Image.asset("assets/images/img_1.png")),
            SizedBox(height: 30,),
            Text("Enable precise location access",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            Text("Your location will be used to give \n you information",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.white54),),
            SizedBox(height: 150,),
            ElevatedButton(onPressed: () {Get.off(MainScreen());}, child: Text("Allow Access")),
            SizedBox(height: 125,),
            SizedBox(width: MediaQuery.sizeOf(context).width*0.5,child: Divider(thickness: 5,))
          ],
        ),
      ),
    );
  }
}
