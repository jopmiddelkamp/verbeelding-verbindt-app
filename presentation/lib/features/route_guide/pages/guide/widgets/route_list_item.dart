import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/entities/route_stop.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/font_weight.dart';
import 'more_info_button.dart';
import 'route_list_indicator.dart';
import 'scan_qr_button.dart';

class RouteListItem extends StatelessWidget {
  final int count;
  final int index;
  final bool active;
  final RouteStopEntity stop;
  final double _padding = 16;

  const RouteListItem({
    Key? key,
    required this.count,
    required this.index,
    required this.active,
    required this.stop,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final isFirst = index == 0;
    final isLast = index == count - 1;
    final isOdd = index % 2 == 1;
    return Container(
      padding: EdgeInsets.fromLTRB(
        _padding,
        isFirst ? _padding : _padding / 2,
        _padding,
        isLast ? _padding : _padding / 2,
      ),
      color: isOdd
          ? Colors.grey.withOpacity(0.01)
          : context.theme.colorScheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RouteListIndicator(
            count: count,
            index: index,
            active: active,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: active ? 1 : 0.5,
                  child: Text(
                    stop.artist.profile.fullName,
                    style: active
                        ? const TextStyle(
                            fontWeight: VVFontWeight.bold,
                          )
                        : null,
                  ),
                ),
                if (stop.artist.previewContent.text.value.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    stop.artist.previewContent.text.value,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 4,
                  ),
                ],
                if (active) _buildActionRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MoreInfoButton(),
        ScanQrButton(),
      ],
    );
  }
}
