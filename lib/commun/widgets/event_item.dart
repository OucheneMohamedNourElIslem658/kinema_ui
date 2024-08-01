import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinema/commun/utils/date_formats.dart';
import 'package:kinema/commun/models/event.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';
import 'custom_network_image.dart';

class EventItem extends StatefulWidget {
  const EventItem({
    super.key,
    required this.event
  });

  final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  var showAllDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          child: CustomNetworkImage(
            backgroundImageURL: widget.event.url,
            shimmerBorderRadius: 8,
            isJustTopRadius: true,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)
            )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    getMonthAbbreviation(widget.event.date.month),
                    style: TextStyles.style25.copyWith(
                      color: CustomColors.greyText2
                    )
                  ),
                  Text(
                    widget.event.date.day.toString(),
                    style: TextStyles.style39,
                  )
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.title,
                      style: TextStyles.style33.copyWith(
                        color: CustomColors.primaryBej
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        showAllDescription = !showAllDescription;
                      }),
                      child: Text(
                        widget.event.description,
                        maxLines: !showAllDescription ? 2 : null,
                        overflow: !showAllDescription ? TextOverflow.ellipsis : null,
                        style: TextStyles.style25.copyWith(
                          color: CustomColors.greyText2,
                        )
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}