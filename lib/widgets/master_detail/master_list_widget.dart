import 'package:flutter/material.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/widgets/master_detail/master_detail_widget.dart';
import 'package:personal_website/widgets/master_detail/master_list_item_clicked.dart';
import 'package:personal_website/widgets/master_detail/master_list_item_widget.dart';

class MasterListWidget extends StatefulWidget {
  final List<MasterDetailData> list;
  final MasterListSelectedCallback itemChangedCallback;
  final double itemHeight;
  final MasterDetailData? preSelectedItem;

  const MasterListWidget({
    super.key,
    required this.list,
    required this.itemChangedCallback,
    required this.preSelectedItem,
    this.itemHeight = 50,
  });

  @override
  State<MasterListWidget> createState() => _MasterListWidgetState();
}

class _MasterListWidgetState extends State<MasterListWidget> {
  MasterDetailData? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem ??= widget.preSelectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildTrack(),
        buildHighlightedPartOfTrack(context),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: buildTextList(context, widget.list),
        )
      ],
    );
  }

  Widget buildTrack() {
    return Container(
      height: widget.itemHeight * widget.list.length,
      width: 2,
      color: Colors.grey,
    );
  }

  Widget buildHighlightedPartOfTrack(
    BuildContext context,
  ) {
    int selectedIndex =
        selectedItem != null ? widget.list.indexOf(selectedItem!) : 0;

    return AnimatedPositioned(
        duration: const Duration(
          milliseconds: 400,
        ),
        top: selectedIndex * widget.itemHeight,
        child: Container(
          width: 2,
          height: widget.itemHeight,
          color: context.colors.primary,
        ));
  }

  Widget buildTextList(
    BuildContext context,
    List<MasterDetailData> list,
  ) {
    return SizedBox(
      height: widget.itemHeight * widget.list.length,
      width: 180,
      child: ListView(
        children: list.map((e) {
          return MasterItemWidget(
            data: e,
            itemSelected: selectedItem == e,
            itemHeight: widget.itemHeight,
            itemClickedCallback: (e) {
              selectedItem = e;
              widget.itemChangedCallback(e);
            },
          );
        }).toList(),
      ),
    );
  }
}
