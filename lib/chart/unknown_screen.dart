import 'package:flutter/material.dart';

class DataChart {
  final String label;
  final double value;

  DataChart(this.label, this.value);
}

final dataChart = [
  DataChart('Barca', 100),
  DataChart('Real', 200),
  DataChart('MU', 300),
  DataChart('Chelsea', 400),
  DataChart('Tot', 100),
  DataChart('MC', 250),
  DataChart('AC Milan', 680),
];

const width = 300.0;
const height = 200.0;

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {
  int? selectedColumnIndex;
  double? adjustedTooltipX;
  double? adjustedTooltipY;
  String? tooltipText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biểu đồ cột cơ bản')),
      body: Center(
        child: GestureDetector(
          onTapUp: (details) {
            _handleTap(details.localPosition);
          },
          onPanUpdate: (DragUpdateDetails details) {
            _handleTap(details.localPosition);
          },
          child: Stack(
            children: [
              CustomPaint(
                size: const Size(width, height), // Kích thước biểu đồ
                painter: BarChartPainter(
                  data: dataChart, // Dữ liệu mẫu
                  barColor: Colors.blue, // Màu cột
                  selectedColumnIndex: selectedColumnIndex,
                ),
              ),
              if (tooltipText != null)
                Positioned(
                  left: adjustedTooltipX,
                  top: adjustedTooltipY,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      width: 43,
                      color: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        tooltipText!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(Offset tapPosition) {
    final barWidth = width / (dataChart.length * 2 - 1);

    final double maxValue = dataChart
        .map((e) => e.value)
        .reduce((a, b) => a > b ? a : b); // Giá trị lớn nhất
    for (int i = 0; i < dataChart.length; i++) {
      final double left = i * barWidth * 2;
      final double right = left + barWidth;
      // Kiểm tra xem tap có nằm trong phạm vi của cột không
      if (tapPosition.dx >= left && tapPosition.dx <= right) {
        setState(() {
          // Nếu cột đã được chọn, bỏ chọn nó (nếu nhấn lại vào cột đã chọn)
          selectedColumnIndex = selectedColumnIndex == i ? null : i;
          if (selectedColumnIndex == null) {
            tooltipText = null;
            return;
          }
          adjustedTooltipX = left + (barWidth - 43) / 2;
          adjustedTooltipY = height * (1 - dataChart[i].value / maxValue) - 40;
          tooltipText = dataChart[i].value.toString();
          if (selectedColumnIndex == 0) {
            adjustedTooltipX = 0;
          }
          if (selectedColumnIndex == dataChart.length - 1) {
            adjustedTooltipX = width - 43;
            adjustedTooltipY = height * (1 - dataChart[i].value / maxValue);
          }
        });
        return;
      }
    }
  }
}

class BarChartPainter extends CustomPainter {
  final List<DataChart> data; // Danh sách dữ liệu
  final Color barColor; // Màu của cột
  final int? selectedColumnIndex;

  BarChartPainter({
    required this.data,
    required this.barColor,
    required this.selectedColumnIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double spacing = 3;
    final dataValue = data.map((e) => e.value).toList();
    final Paint barPaint = Paint()..color = barColor;
    final Paint selectedBarPaint = Paint()..color = Colors.red;
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5;
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
    );

    // Tính toán kích thước
    final double barWidth = size.width / (data.length * 2 - 1);

    final double maxValue =
        dataValue.reduce((a, b) => a > b ? a : b); // Giá trị lớn nhất
    final double markStep = maxValue / 3;

    for (int i = 0; i < 4; i++) {
      final double markValue = markStep * i; // Mỗi mốc giá trị
      final double markY =
          size.height * (1 - markValue / maxValue); // Vị trí Y của mốc

      textPainter.text = TextSpan(
        text: markValue.toInt().toString(), // Hiển thị giá trị mốc
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );

      textPainter.layout(); // Tính toán kích thước văn bản
      textPainter.paint(
        canvas,
        Offset(-35, markY - textPainter.height / 2),
      ); // Vẽ văn bản
    }

    for (int i = 0; i < data.length; i++) {
      final double left = i * barWidth * 2;
      final double right = left + barWidth;
      final double top = size.height * (1 - data[i].value / maxValue);
      final double bottom = size.height;

      final Paint currentBarPaint =
          selectedColumnIndex == i ? selectedBarPaint : barPaint;

      // Vẽ cột
      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        currentBarPaint,
      );
      textPainter.text = TextSpan(
        text: data[i].label,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout(); // Tính toán kích thước văn bản
      final double textX = left + (barWidth - textPainter.width) / 2;
      final double textY = bottom + 4; // Cách cột 4px
      textPainter.paint(canvas, Offset(textX, textY));
    }

    canvas.drawLine(
      Offset(-spacing, size.height),
      Offset(size.width, size.height),
      borderPaint,
    );
    canvas.drawLine(
      Offset(-spacing, -20),
      Offset(-spacing, size.height),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant BarChartPainter oldDelegate) {
    return oldDelegate.selectedColumnIndex != selectedColumnIndex;
  }
}
