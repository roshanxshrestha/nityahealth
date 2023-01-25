import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/controller/wellness_controller.dart';

class SinglePostPage extends StatelessWidget {
  SinglePostPage({super.key});
  final _controller = Get.put(WellnessController());

  @override
  Widget build(BuildContext context) {
    log("id= ${_controller.id.value}");
    _controller.getSinglePostData(_controller.id.value);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: _controller.title.value),
      body: SingleChildScrollView(
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
                    data: _controller.singlePost.value.post?.description ?? "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
