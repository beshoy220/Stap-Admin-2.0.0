import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/data/local_data/days_of_the_week.dart';
import 'package:stap_admin/data/local_data/grade_class_enum_list.dart';

class TeacherViewTable extends StatefulWidget {
  const TeacherViewTable({super.key});

  @override
  State<TeacherViewTable> createState() => _TeacherViewTableState();
}

class _TeacherViewTableState extends State<TeacherViewTable> {
  int daysOfTheWeekListIndex = 0;
  int teacherIndex = 0;

  List listOfSelectedGrade = [
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
    'Select grade',
  ];

  List listOfSelectedClass = [
    'Select class',
    'Select class',
    'Select class',
    'Select class',
    'Select class',
    'Select class',
    'Select class',
    'Select class',
    'Select class',
  ];
  List<String> listOfAvailableTeachers = [
    'Mr Ahmed ',
    'Mr Kareem Khaled',
    'Mrs Amany'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: double.maxFinite,
          color: meta.colorPallet.primary300,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (teacherIndex == 0) {
                      } else {
                        teacherIndex--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    color: meta.colorPallet.primary700,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/profile.png',
                                  ),
                                )),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            listOfAvailableTeachers[teacherIndex],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (teacherIndex + 1 == listOfAvailableTeachers.length) {
                      } else {
                        teacherIndex++;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: meta.colorPallet.primary700,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 45,
          width: double.maxFinite,
          color: meta.colorPallet.primary200,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (daysOfTheWeekListIndex != 0) {
                        daysOfTheWeekListIndex--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    color: meta.colorPallet.primary700,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Text(
                    daysOfTheWeekList[daysOfTheWeekListIndex],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (daysOfTheWeekListIndex != 4) {
                        daysOfTheWeekListIndex++;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: meta.colorPallet.primary700,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: double.maxFinite,
          color: meta.colorPallet.primary100,
          child: const Row(
            children: [
              Expanded(child: Center(child: Text('No.'))),
              Expanded(flex: 3, child: Center(child: Text('Grade'))),
              Expanded(flex: 3, child: Center(child: Text('Class')))
            ],
          ),
        ),
        ListView.builder(
          itemCount: 9,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 40,
              width: double.maxFinite,
              // color: meta.colorPallet.primary100,
              child: Row(
                children: [
                  Expanded(child: Center(child: Text('${index + 1}'))),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          // value: _selectedValue,
                          hint: Text(listOfSelectedGrade[index]),
                          items: gradeList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              listOfSelectedGrade[index] = newValue;
                            });
                          },
                          dropdownColor: meta.colorPallet.grey100,
                          style: TextStyle(
                            color: meta.colorPallet.pureBlack,
                            fontSize: 16,
                          ),
                          icon: Icon(Icons.arrow_drop_down,
                              color: meta.colorPallet.pureBlack),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            // value: _selectedValue,
                            hint: Text(listOfSelectedClass[index]),
                            items: classList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                listOfSelectedClass[index] = newValue;
                              });
                            },
                            dropdownColor: meta.colorPallet.grey100,
                            style: TextStyle(
                              color: meta.colorPallet.pureBlack,
                              fontSize: 16,
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: meta.colorPallet.pureBlack),
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
