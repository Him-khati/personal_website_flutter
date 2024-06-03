import 'package:flutter/material.dart';
import 'package:personal_website/widgets/master_detail/master_detail_data.dart';
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

  late AnimationController _controller;
  MasterDetailData? selectedMasterItem;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MasterListWidget(
              list : widget.masterDetailData,
              itemChangedCallback : (e){
                selectedMasterItem = e;
                setState(() {});
              }
            ),
            selectedMasterItem?.widget ?? const SizedBox.shrink()
          ],
        )
      ],
    );
  }
}
