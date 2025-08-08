import 'package:flutter/material.dart';
import 'AstroDataScreen.dart';

class DailyAstroScreen extends StatefulWidget {
  @override
  State<DailyAstroScreen> createState() => _DailyAstroScreenState();
}

class _DailyAstroScreenState extends State<DailyAstroScreen> {
  bool loader = true;
  int selectedDay = 1;
  String selectedMonth = 'January';
  String selectedReligion = 'Hindu';
  String selectedGender = 'Boy';
  String selectedZodiac = 'Aries';

  @override
  void initState() {
    super.initState();
    // callapi();
  }

  callapi() async {
    //dailyAstroList = await ApiManager().ListAstroData();
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  DropdownButton<int>(
                    value: selectedDay,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                    items: List.generate(31, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      );
                    }),
                    hint: Text('Select Day'),
                  ),
                  SizedBox(width: 40),
                  DropdownButton<String>(
                    value: selectedMonth,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                    items: [
                      for (var month in [
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December',
                      ])
                        DropdownMenuItem<String>(
                          value: month,
                          child: Text(month),
                        ),
                    ],
                    hint: Text('Select Month'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedZodiac,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedZodiac = newValue!;
                      });
                    },
                    items:
                        [
                          'Aries',
                          'Taurus',
                          'Gemini',
                          'Cancer',
                          'Leo',
                          'Virgo',
                          'Libra',
                          'Scorpio',
                          'Sagittarius',
                          'Capricorn',
                          'Aquarius',
                          'Pisces',
                        ].map((zodiac) {
                          return DropdownMenuItem<String>(
                            value: zodiac,
                            child: Text(zodiac),
                          );
                        }).toList(),
                    hint: Text('Select Zodiac Sign'),
                  ),
                  SizedBox(width: 30),
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: [
                      for (var gender in ['Boy', 'Girl', 'Unisex'])
                        DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ),
                    ],
                    hint: Text('Select Gender'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              DropdownButton<String>(
                value: selectedReligion,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedReligion = newValue!;
                  });
                },
                items: [
                  for (var gender in ['Hindu', 'Christian', 'Muslim'])
                    DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    ),
                ],
                hint: Text('Select Gender'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AstroDataScreen(
                        day: selectedDay.toString(),
                        month: selectedMonth,
                        religion: selectedReligion,
                        sign: selectedZodiac,
                        gender: selectedGender,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Get Astrological Name", // Display the selected zodiac sign
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
