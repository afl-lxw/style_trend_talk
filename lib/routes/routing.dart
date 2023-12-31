import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:style_trend_talk/pages/index.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/main', page: () => const MainPageMiddle()),
  GetPage(name: '/video', page: () => const DiscoverPageMiddle()),
  GetPage(name: '/notification', page: () => const NotificationPage()),
  GetPage(name: '/profile', page: () => const ProfilePage()),
  GetPage(name: '/search', page: () => const SeniorSearch()),
  GetPage(name: '/publish', page: () => const PublishWidgetPage()),
  GetPage(name: '/recommendationDetails', page: () => DetailsPage()),
  GetPage(name: '/trend', page: () => const TrendPage()),
  GetPage(name: '/chart', page: () => ChatPages()),

  // 添加其他路由和详情页的GetPage
];

final List<Widget> routing = [
  PageStorage(
    bucket: PageStorageBucket(),
    child: const MainPageMiddle(), // 替换为你的第二个页面组件
  ),
  PageStorage(
    bucket: PageStorageBucket(),
    child: const DiscoverPageMiddle(), // 替换为你的第二个页面组件
  ),
  PageStorage(
    bucket: PageStorageBucket(),
    child: const NotificationPage(), // 替换为你的第二个页面组件
  ),
  PageStorage(
    bucket: PageStorageBucket(),
    child: const ProfilePage(), // 替换为你的第二个页面组件
  ),
];
