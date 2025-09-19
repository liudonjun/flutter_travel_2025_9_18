import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_travel/common/index.dart';
import 'package:flutter_travel/init.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => const ClassicHeader(
            refreshingText: '正在刷新。。',
            completeText: '刷新完成',
            failedText: '刷新失败',
            idleText: '下拉刷新',
            releaseText: '松开手指刷新',
          ),
          footerBuilder: () => const ClassicFooter(
            failedText: '加载失败',
            loadingText: '加载中。。',
            idleText: '上拉加载',
            noDataText: '已全部加载完成',
          ),
          hideFooterWhenNotFull: true,
          headerTriggerDistance: 80,
          maxOverScrollExtent: 100,
          footerTriggerDistance: 150,
          child: GetMaterialApp(
            title: 'flutter_travel',
            initialRoute: RouteNames.main,
            debugShowCheckedModeBanner: false,
            getPages: RoutePages.list,
            defaultTransition: Transition.cupertino,
            builder: (context, widget) {
              widget = EasyLoading.init()(context, widget);
              return GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                  FocusScope.of(context).unfocus();
                },
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.0),
                  ),
                  child: widget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
