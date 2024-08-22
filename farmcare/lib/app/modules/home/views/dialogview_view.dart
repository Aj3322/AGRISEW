import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogviewView extends GetView {
  const DialogviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farm Care'),
        centerTitle: true,
      ),
      body:  Center(
        child: ListView(children: [ListTile(title: Text("Setting"),),ListTile(title: Text("Setting"),),ListTile(title: Text("Setting"),),ListTile(title: Text("Setting"),)]),
      ),
    );
  }
}
