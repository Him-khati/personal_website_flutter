import 'package:flutter/material.dart';
import 'package:personal_website/theme/text_themes.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/widgets/master_detail/master_detail_widget.dart';
import 'package:personal_website/widgets/master_detail/master_list_item_clicked.dart';

class MasterItemWidget extends StatefulWidget {

  final MasterDetailData data;
  final bool itemSelected;
  final double itemHeight;
  final MasterListSelectedCallback itemClickedCallback;

  const MasterItemWidget({
    super.key,
    required this.data,
    required this.itemSelected,
    required this.itemHeight,
    required this.itemClickedCallback
  });

  @override
  State<MasterItemWidget> createState() => _MasterItemWidgetState();
}

class _MasterItemWidgetState extends State<MasterItemWidget> {
  bool itemHovered = false;

  @override
  Widget build(BuildContext context) {
    bool highlightItem = widget.itemSelected || itemHovered;

    return MouseRegion(
      child: GestureDetector(
        onTap: (){
          widget.itemClickedCallback(widget.data);
        },
        child: AnimatedContainer(
          height: widget.itemHeight,
          duration: const Duration(milliseconds: 400),
          color: highlightItem ? context.colors.primary.withOpacity(
            0.2
          ) : Colors.transparent,
          child: Center(
            child: Flexible(
              child: Text(
                widget.data.title,
                softWrap: true,
                style: context.textTheme.titleMedium?.copyWith(
                  color: highlightItem ? context.colors.primary : null
                ),
              ),
            ),
          ),
        ),
      ),
      onExit: (e){
        setState(() {
          itemHovered = false;
        });
      },
      onEnter: (e){
        setState(() {
          itemHovered = true;
        });
      },
    );
  }
}
