import 'package:book_of_fate/presentation/components/base_button.dart';
import 'package:book_of_fate/presentation/components/custom_scaffold.dart';
import 'package:book_of_fate/presentation/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextInputFormatter digitsOnly = FilteringTextInputFormatter.digitsOnly;

  @override
  void dispose() {
    nameController.dispose();
    yearController.dispose();
    monthController.dispose();
    dayController.dispose();
    super.dispose();
  }

  bool isValidDate() {
    try {
      final year = int.tryParse(yearController.text);
      final month = int.tryParse(monthController.text);
      final day = int.tryParse(dayController.text);

      final date = DateTime(year!, month!, day!);
      return date.year == year && date.month == month && date.day == day;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      colorFilter: exposure(1.3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InputField(hintText: '이름을 입력하세요', controller: nameController),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: InputField(
                    hintText: '연도',
                    controller: yearController,
                    inputFormatter: [digitsOnly],
                  ),
                ),
                Expanded(
                  child: InputField(
                    hintText: '월',
                    controller: monthController,
                    inputFormatter: [digitsOnly],
                  ),
                ),

                Expanded(
                  child: InputField(
                    hintText: '일',
                    controller: dayController,
                    inputFormatter: [digitsOnly],
                  ),
                ),
              ],
            ),
            BaseButton(
              text: '제출',
              onPressed: () {
                bool validDate = isValidDate();
                if (validDate) {}

                debugPrint(
                  'name: ${nameController.text}, year: ${yearController.text}, month: ${monthController.text}, day: ${dayController.text}, isValidDate: $validDate',
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          ],
        ),
      ),
    );
  }

  ColorFilter exposure(double exposure) {
    return ColorFilter.matrix([
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      exposure,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }
}
