import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/views/wellness_categ_child.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/controller/wellness_controller.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/model/wellness_child_model.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GridViewList extends StatelessWidget {
  final _controller = Get.put(WellnessController());
  int id;
  GridViewList(this.id, {super.key});

  final _refreshKey = GlobalKey<ScaffoldState>();
  final RefreshController _refreshConroller = RefreshController();
  final bool _enablePullDown = true;

  @override
  Widget build(BuildContext context) {
    _controller.getWellnessChildList(id);
    print("wellnessId= $id");

    return Scaffold(
      key: _refreshKey,
      body: SmartRefresher(
        enablePullDown: _enablePullDown,
        controller: _refreshConroller,
        header: const WaterDropHeader(),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 0));
          _refreshConroller.refreshCompleted();
        },
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 0,
                ),
                shrinkWrap: true,
                itemCount:
                    _controller.wellnessChildList.value.wellnessChild?.length ??
                        0,
                itemBuilder: (BuildContext context, int index) {
                  WellnessChild? model =
                      _controller.wellnessChildList.value.wellnessChild?[index];
                  return InkWell(
                    onTap: () {
                      _controller.pageId.value = model?.id ?? 0;
                      Get.to(WellnessCategoryChild());
                    },
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.secondaryColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 8, left: 5),
                                child: Image.network(
                                  model?.icon ?? "",
                                  height: 88,
                                  width: 88,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: textF16W700(model?.title ?? ""),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
