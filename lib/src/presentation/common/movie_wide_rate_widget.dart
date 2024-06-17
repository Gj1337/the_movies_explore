import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

const _minRate = 0;
const _maxRate = 5;

class MovieWideRateWidget extends StatelessWidget {
  const MovieWideRateWidget({
    required this.rate,
    super.key,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    final roundedRate = min(max(rate, _minRate), _maxRate);

    final starRate = List.generate(
      _maxRate,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: SvgPicture.asset(
          width: 20,
          height: 20,
          index + 1 <= roundedRate
              ? starIconFull
              : index + 1 <= roundedRate + 0.5
                  ? starIconHalf
                  : starIconEmpty,
        ),
      ),
    );

    return SizedBox(
      height: 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 4,
          ),
          Text(
            roundedRate.toStringAsFixed(1),
            style: wideMovieRateNumberTextStyle,
          ),
          const SizedBox(width: 6.5),
          ...starRate,
        ],
      ),
    );
  }
}
