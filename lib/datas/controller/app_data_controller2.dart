import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../model/subject_data_model.dart';

class AppDataController2 extends GetxController {
  List<SubjectModel> subjectData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"subject_id": "1", "subject_name": "Tractor"},
        {"subject_id": "2", "subject_name": "Harvester"},
        {"subject_id": "3", "subject_name": "Cultivator"},
        {"subject_id": "4", "subject_name": "Thresher"},
        {"subject_id": "5", "subject_name": "Trolley"},
        {"subject_id": "6", "subject_name": "SprayGun"},
        //{"subject_id": "7", "subject_name": ""},
        //{"subject_id": "8", "subject_name": "Arts"}
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
      subjectData.addAll(tempSubjectData);

      dropDownData = subjectData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.subjectName);
      }).toList();

      update();
    }
  }
}
