// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sinoproject/models/insx_model.dart';
import 'package:sinoproject/utility/app_constant.dart';
import 'package:sinoproject/utility/app_controller.dart';
import 'package:sinoproject/utility/app_debouncer.dart';
import 'package:sinoproject/utility/app_service.dart';
import 'package:sinoproject/widgets/widget_form.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({
    super.key,
    required this.insxModels,
  });

  final List<InsxModel> insxModels;

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  TextEditingController searchController = TextEditingController();

  final appDebouncer = AppDebouncer(milliSecond: 500);

  var resultSearchs = <InsxModel>[];

  AppController controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    processAddAll();
  }

  void processAddAll() {
    if (resultSearchs.isNotEmpty) {
      resultSearchs.clear();
    }

    for (var element in widget.insxModels) {
      resultSearchs.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (AppController appController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ข้อมูล ${appController.insxModels.length} รายการ'),
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ListView(
              children: [
                WidgetForm(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'กรอกชื่อที่ค้นหา',
                  controller: searchController,
                  onChanged: (p0) {
                    appDebouncer.run(() {
                      processAddAll();

                      resultSearchs = resultSearchs
                          .where(
                            (element) => element.cus_name
                                .toLowerCase()
                                .contains(p0.toLowerCase()),
                          )
                          .toList();

                      setState(() {});
                    });
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: resultSearchs.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.back(result: resultSearchs[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: AppConstant().curbeBox(color: Colors.black),
                      child: Row(
                        children: [
                          FutureBuilder(
                            future: AppService().findWidgetPindrop(
                                notiDate: resultSearchs[index].noti_date),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!;
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                          Text(resultSearchs[index].cus_name),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
