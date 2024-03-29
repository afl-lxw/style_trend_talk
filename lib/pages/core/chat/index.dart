import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:style_trend_talk/data/models/mock/chat.dart';
import 'package:style_trend_talk/pages/core/chat/controllers/chatController.dart';
import 'package:style_trend_talk/pages/core/chat/myChatMessage.dart';

import 'chartHeader.dart';
import 'chatMessage.dart';

class ChatPages extends GetView<ChartController> {
  final TextEditingController _textController = TextEditingController();

  // final List<ChartModel> _messages = <ChartModel>[];
  final FocusNode _focusNode = FocusNode();

  ChatPages({super.key});

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  final discoverController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
      init: ChartController(),
      // init: controller, // 在这里调用 init 方法
      id: "chart",
      builder: (_) {
        return Scaffold(
          body: _chartScafold(context),
        );
      },
    );
  }

  Scaffold _chartScafold(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessAppTheme.white,
      resizeToAvoidBottomInset: true, // assign true
      body: CustomScrollView(
        slivers: [
          const ChartHeader(),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, int index) => discoverController
                                .chartList[index].id ==
                            1
                        ? ChatMessage(
                            discoverController.chartList[index],
                            index == 0
                                ? null
                                : discoverController.chartList[index - 1],
                            index == discoverController.chartList.length - 1
                                ? null
                                : discoverController.chartList[index + 1],
                          )
                        : MyChatMessage(discoverController.chartList[index]),
                    itemCount: discoverController.chartList.length,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: _textComposerWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: const IconThemeData(color: Color.fromARGB(255, 0, 140, 255)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 32, left: 10, right: 10),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.zero,
              width: 38,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.circlePlus,
                  size: 18,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.zero,
              width: 38,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.camera,
                  size: 18,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.zero,
              width: 38,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.image,
                  size: 18,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.zero,
              width: 38,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.microphone,
                  size: 18,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
            Flexible(child: _textField()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.zero,
              width: 38,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.solidThumbsUp,
                  size: 18,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return IconTheme(
        data: const IconThemeData(color: Color.fromARGB(255, 0, 140, 255)),
        child: ClipRRect(
            // 裁剪一个borderRadius为25的矩形
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: 36,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: TextField(
                  focusNode: _focusNode,
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 241, 241, 241),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    hintText: 'Aa......',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 93, 93, 93)),
                    suffixIcon: Icon(
                      FontAwesomeIcons.ghost,
                      color: Color.fromARGB(255, 0, 140, 255),
                      size: 18,
                    ),
                    border: InputBorder.none,
                  ),
                ))));
  }
}
