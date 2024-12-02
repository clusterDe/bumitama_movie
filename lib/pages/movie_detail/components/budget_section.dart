// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bumitama_movie/extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/movie_detail_model/movie_detail_model.dart';

class BudgetSection extends StatelessWidget {
  const BudgetSection({
    super.key,
    this.movieDetail,
  });

  final MovieDetailModel? movieDetail;

  @override
  Widget build(BuildContext context) {
    print('budget : ${movieDetail?.budget}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      child: Column(
        children: [
          const SizedBox(height: defPadding),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Budget',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: defPadding / 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: movieDetail?.budget != 0 ? true : false,
              replacement: const Text('-'),
              child: Text.rich(
                TextSpan(
                  text: '\$ ',
                  children: [
                    TextSpan(
                      text: '${movieDetail?.budget ?? '-'}'.currencyFormat,
                    )
                  ],
                ),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: defPadding),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Revenue',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: defPadding / 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: movieDetail?.revenue != 0 ? true : false,
              replacement: const Text('-'),
              child: Text.rich(
                TextSpan(
                  text: '\$ ',
                  children: [
                    TextSpan(
                      text: '${movieDetail?.revenue ?? '-'}'.currencyFormat,
                    )
                  ],
                ),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
