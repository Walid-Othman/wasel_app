import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';

class RevenueBarChart extends StatefulWidget {
  const RevenueBarChart({super.key});

  @override
  State<RevenueBarChart> createState() => _RevenueBarChartState();
}

class _RevenueBarChartState extends State<RevenueBarChart> {

  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
  
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          isAnimated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 2000,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.round()} \$',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (double value, TitleMeta meta) {
                const hours = ['10am', '11am', '12pm', '01pm', '02pm', '03pm', '04pm'];
                int index = value.toInt();
                if (index < 0 || index >= hours.length) return const SizedBox();
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 4,
                  child: Text(hours[index], style:  TextStyle(fontSize:AppSizes.sp12, color: Colors.grey)),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: _getBarGroups(),
      ),
   
      swapAnimationDuration: const Duration(milliseconds: 1500), 
      swapAnimationCurve: Curves.easeOutQuart, 
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
 
      _makeBarGroup(0, isAnimated ? 1700 : 0),
      _makeBarGroup(1, isAnimated ? 1500 : 0),
      _makeBarGroup(2, isAnimated ? 1300 : 0),
      _makeBarGroup(3, isAnimated ? 1000 : 0),
      _makeBarGroup(4, isAnimated ? 1300 : 0),
      _makeBarGroup(5, isAnimated ? 1500 : 0),
      _makeBarGroup(6, isAnimated ? 1700 : 0),
    ];
  }

  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: LightColors.orangeColor,
          width:AppSizes.w16,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 2000, 
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}