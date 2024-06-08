import 'package:daily_utils/daily_utils.dart';
import 'package:flutter/material.dart';
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

class _MasterDetailsWidgetState extends State<MasterDetailsWidget> {
  MasterDetailData? selectedMasterItem;

  @override
  void initState() {
    super.initState();
    selectedMasterItem ??= widget.masterDetailData.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MasterListWidget(
            list: widget.masterDetailData,
            preSelectedItem: selectedMasterItem,
            itemChangedCallback: (e) {
              selectedMasterItem = e;
              setState(() {});
            }),
        const HorizonatalGapWidget(40),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: SizedBox(
              height: 400,
              width: 1200,
              key: selectedMasterItem?.widget.key,
              child: selectedMasterItem?.widget ?? const SizedBox()),
        ),
      ],
    );
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
