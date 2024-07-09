import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';
import 'package:stap_admin/data/local_data/days_of_the_week.dart';
import 'package:stap_admin/data/local_data/grade_class_enum_list.dart';
import 'package:stap_admin/data/local_data/subjects.dart';

class StudentViewTable extends StatefulWidget {
  const StudentViewTable({super.key});

  @override
  State<StudentViewTable> createState() => _StudentViewTableState();
}

class _StudentViewTableState extends State<StudentViewTable> {
  int daysOfTheWeekListIndex = 0;
  int gradeIndex = 0;
  int classIndex = 0;

  List listOfSelectedSubjects = [
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
    'Select subject',
  ];

  List listOfSelectedTeachers = [
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
    'Select Teacher',
  ];
  List<String> listOfAvailableTeachers = [
    'Mr Ahmed',
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
                      if (gradeIndex == 0 && classIndex == 0) {
                      } else {
                        if (classIndex == 0) {
                          gradeIndex--;
                          classIndex = 9;
                        } else {
                          classIndex--;
                        }
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
                      '${gradeList[gradeIndex]} - ${classList[classIndex]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (gradeIndex == 11 && classIndex == 9) {
                      } else {
                        if (classIndex == 9) {
                          gradeIndex++;
                          classIndex = 0;
                        } else {
                          classIndex++;
                        }
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
              Expanded(flex: 3, child: Center(child: Text('Subject'))),
              Expanded(flex: 3, child: Center(child: Text('Teacher')))
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
                          hint: Text(listOfSelectedSubjects[index]),
                          items: subjects.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              listOfSelectedSubjects[index] = newValue;
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
                            hint: Text(listOfSelectedTeachers[index]),
                            items: listOfAvailableTeachers.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                listOfSelectedTeachers[index] = newValue;
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
