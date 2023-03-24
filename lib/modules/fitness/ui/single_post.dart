import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/modules/fitness/controller/fitness_controller.dart';
import '../../../common/custom_button.dart';
import '../../../common/text_style.dart';

class FitnessSinglePost extends StatelessWidget {
  FitnessSinglePost({super.key});
  final _controller = Get.put(FitnessController());

  @override
  Widget build(BuildContext context) {
    log("id= ${_controller.id.value}");
    log("pagetitle= ${_controller.title.value}");
    _controller.getSingleFitnessPost(_controller.id.value);
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Html(
                      data:
                          _controller.singlePost.value.post?.description ?? "",
                    ),
                    const SizedBox(height: 8),
                    customButton1("Start", "fitnesstimer", context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
