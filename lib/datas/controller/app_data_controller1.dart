import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../model/subject_data_model.dart';

class AppDataController1 extends GetxController {
  List<SubjectModel> CropsData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    CropsData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"subject_id": "1", "subject_name": "Apple"},
        {"subject_id": "2", "subject_name": "Banana"},
        {"subject_id": "3", "subject_name": "Bean"},
        {"subject_id": "4", "subject_name": "Black and Green Gram"},
        {"subject_id": "5", "subject_name": "Brinjal"},
        {"subject_id": "6", "subject_name": "Cabbage"},
        {"subject_id": "7", "subject_name": "Capsicum and chilli"},
        {"subject_id": "8", "subject_name": "Chickpea and gram"},
        {"subject_id": "9", "subject_name": "Lemon"},
        {"subject_id": "10", "subject_name": "Cotton"},
        {"subject_id": "11", "subject_name": "Rice"},
        {"subject_id": "12", "subject_name": "Wheat"},
        {"subject_id": "13", "subject_name": "Sugarcane"},
        {"subject_id": "14", "subject_name": "Potato"},
        {"subject_id": "15", "subject_name": "Tomato"}
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SubjectModel> tempSubjectData = [];
      apiResponse['data'].forEach(
        (data) {
          tempSubjectData.add(
            SubjectModel(
              subjectId: data['subject_id'],
              subjectName: data['subject_name'],
            ),
          );
        },
      );
      print(tempSubjectData);
      CropsData.addAll(tempSubjectData);

      dropDownData = CropsData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.subjectName);
      }).toList();

      update();
    }
  }
}
