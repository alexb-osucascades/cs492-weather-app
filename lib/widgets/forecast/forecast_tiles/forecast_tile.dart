import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weatherapp/providers/forecast_provider.dart';
import 'package:weatherapp/providers/theme_provider.dart';

import '../../../models/forecast.dart';

class ForecastTileWidget extends StatelessWidget {
  const ForecastTileWidget({super.key, required this.forecast});

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.read<ThemeProvider>();
    final theme = Theme.of(context);

    // Create a dynamic gradient
    final gradientColors = forecast.isDaytime
        ? [themeProvider.daytimeColor.withValues(alpha: 0.2), theme.cardColor]
        : [themeProvider.nighttimeColor.withValues(alpha: 0.2), theme.cardColor];

    final semanticsString =
        "${forecast.name}, ${forecast.shortForecast}, ${forecast.detailedForecast}";

    return Semantics(
      label: semanticsString,
      child: InkWell(
        onTap: () {
          context.read<ForecastProvider>().setActiveForecast(forecast);
        },
        child: SizedBox(
          width: 160,
          height: 200,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: ExcludeSemantics(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        forecast.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SvgPicture.asset(
                        forecast.imagePath,
                        semanticsLabel: forecast.shortForecast,
                        height: 40,
                      ),
                      Text(
                        "${forecast.temperature}°",
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        forecast.shortForecast,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}