import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class GuidePageRouteListItem extends StatelessWidget {
  const GuidePageRouteListItem({
    Key? key,
    required this.count,
    required this.index,
    required this.active,
    required this.stop,
  }) : super(key: key);

  final int count;
  final int index;
  final bool active;
  final RouteStopEntity stop;
  final double _padding = 16;

  bool get isFirst => index == 0;
  bool get isLast => index == count - 1;
  bool get isOdd => index % 2 == 1;

  @override
  Widget build(
    BuildContext context,
  ) {
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
          GuidePageRouteListIndicator(
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
                if (active &&
                    stop.artist.previewContent.text.value.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    stop.artist.previewContent.text.value,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 4,
                  ),
                ],
                if (active)
                  _buildActionRow(
                    context,
                    stop: stop,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(
    BuildContext context, {
    required RouteStopEntity stop,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GuidePageMoreInfoButton(
          artist: stop.artist,
        ),
        GuidePageScanQrButton(
          stop: stop,
        ),
      ],
    );
  }
}
