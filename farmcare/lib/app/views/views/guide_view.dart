import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GuideView extends GetView {
  const GuideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuideView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuideView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
