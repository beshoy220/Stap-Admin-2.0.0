import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';

class SchoolStatisticsScreen extends StatefulWidget {
  const SchoolStatisticsScreen({super.key});

  @override
  State<SchoolStatisticsScreen> createState() => _SchoolStatisticsScreenState();
}

class _SchoolStatisticsScreenState extends State<SchoolStatisticsScreen> {
  int selectedStatisticsFeature = 0;
  List listOfStatisticsFeatures = [
    'Students',
    'Teachers',
    'Parents',
    'Boards',
    'Homeworks',
    'Quizzes',
    'Attendance',
    'Media'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meta.colorPallet.primary700,
        iconTheme: IconThemeData(color: meta.colorPallet.pureWhite),
        title: Text(
          'School statistics',
          style: TextStyle(
            color: meta.colorPallet.pureWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: meta.colorPallet.primary700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account quota',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: meta.colorPallet.pureWhite,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: meta.colorPallet.grey100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 5.0,
                              percent: 0.4,
                              center: const Text(
                                '462',
                                style: TextStyle(fontSize: 24),
                              ),
                              progressColor: meta.colorPallet.primary700,
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Current accepted accounts 462',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: 5),
                                  // Text(
                                  //   'You have used 71% of your current quota ',
                                  //   style: TextStyle(fontSize: 12),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Teachers: 12'),
                                Text('Parents: 102'),
                                Text('Students: 300'),
                                Text('Boards: 48'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfStatisticsFeatures.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedStatisticsFeature = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (selectedStatisticsFeature == index)
                              ? meta.colorPallet.grey100
                              : meta.colorPallet.primary700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listOfStatisticsFeatures[index],
                              style: TextStyle(
                                  color: (selectedStatisticsFeature == index)
                                      ? meta.colorPallet.pureBlack
                                      : meta.colorPallet.pureWhite),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Center(
                  child: Image.asset(
                'assets/undraw_pics/2.png',
                scale: 3,
              )),
              const Center(
                child: Text(
                  'Ops, there is no data!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Center(
                child: Text(
                  'It seems that your school is not using this feature\ntry using it to see some statistics.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Widget center;
  final Color progressColor;

  const CircularPercentIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.center,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: radius,
            height: radius,
            child: CircularProgressIndicator(
              strokeWidth: lineWidth,
              value: percent,
              color: progressColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          Center(child: center),
        ],
      ),
    );
  }
}
