import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/widgets/animated_fade_in_widget.dart';
import 'package:personal_website/widgets/master_detail/master_list_widget.dart';

class MasterDetailsWidget extends StatefulWidget {
  final List<MasterDetailData> masterDetailData;

  const MasterDetailsWidget({
    super.key,
    required this.masterDetailData,
  });

  @override
  State<MasterDetailsWidget> createState() => _MasterDetailsWidgetState();
}

class _MasterDetailsWidgetState extends State<MasterDetailsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  MasterDetailData? selectedMasterItem;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..forward();
    selectedMasterItem ??= widget.masterDetailData.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    print("object printed above");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MasterListWidget(
            list: widget.masterDetailData,
            preSelectedItem: selectedMasterItem,
            itemChangedCallback: (e) {
              controller
                ..reset()
                ..forward();

              selectedMasterItem = e;
              setState(() {});

              print("object printed");
            }),
        const HorizonatalGapWidget(40),
        selectedMasterItem?.widget ?? const SizedBox.shrink()
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MasterDetailData {
  String id;
  String title;
  Widget widget;

  MasterDetailData({
    required this.id,
    required this.title,
    required this.widget,
  });
}
