import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/common/timer.dart';
import '../../../common/custom_appbar.dart';
import '../controller/yoga_controller.dart';

class YogaTimer extends StatelessWidget {
  YogaTimer({super.key});

  final _controller = Get.put(YogaController());

  @override
  Widget build(BuildContext context) {
    log("id= ${_controller.id.value}");
    log("pagetitle= ${_controller.title.value}");
    _controller.getSingleYogaPost(_controller.id.value);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: _controller.title.value),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.only(top: 105),
          child: Column(
            children: [
              _controller.singlePost.value.post?.image != null
                  ? SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        _controller.singlePost.value.post?.image ?? "",
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Center(
                          child: customText(
                            _controller.singlePost.value.post?.title ?? "",
                            18,
                            FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const TimerWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
