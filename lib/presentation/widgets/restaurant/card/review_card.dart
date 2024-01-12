import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/review/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          // Person Icon
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: EColors.orangePrimary,
                width: 6,
              ),
              borderRadius: BorderRadius.circular(70),
            ),
            child: const Icon(
              Icons.person_outlined,
              color: EColors.orangePrimary,
              size: 60,
            ),
          ),
          const SizedBox(width: 20),
          // Review
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Rating
                Row(
                  children: [
                    Text(
                      review.user_email.split('@')[0],
                      style: EColors.black.w700.s14,
                    ),
                    const Spacer(),
                    // rating (5 stars icon)
                    Row(
                        children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < review.rating
                            ? EColors.orangeSecondary
                            : EColors.greyPrimary,
                        size: 18,
                      ),
                    )),
                  ],
                ),
                // Comment
                const SizedBox(height: 10),
                Text(
                  review.comment,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: EColors.black.w400.s12,
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(
                    DateTime.parse(review.created_at).toLocal(),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: EColors.greyPrimary.w400.s12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
