import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../datas/controller/app_data_controller.dart';
import '../datas/model/subject_data_model.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _password;
  late String _url;
  late String _phoneNumber;
  late String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppDataController controller = Get.put(AppDataController());

  List dropDownListData = [
    {"title": "BCA", "value": "1"},
    {"title": "MCA", "value": "2"},
    {"title": "B.Tech", "value": "3"},
    {"title": "M.Tech", "value": "4"},
  ];

  String defaultValue = "";
  String secondDropDown = "";

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _url = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _url = value!;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        int? calories = int.tryParse(value.toString());

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String? value) {
        _calories = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List subjectData = [];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _builURL(),
                _buildPhoneNumber(),
                _buildCalories(),
                SizedBox(height: 100),
                Column(
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        _formKey.currentState!.save();

                        print(_name);
                        print(_email);
                        print(_phoneNumber);
                        print(_url);
                        print(_password);
                        print(_calories);

                        //Send to API
                      },
                    ),
                    //SizedBox(height: 100);

                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isDense: true,
                            value: defaultValue,
                            isExpanded: true,
                            menuMaxHeight: 350,
                            items: [
                              const DropdownMenuItem(
                                  child: Text(
                                    "Select Course",
                                  ),
                                  value: ""),
                              ...dropDownListData
                                  .map<DropdownMenuItem<String>>((data) {
                                return DropdownMenuItem(
                                    value: data['value'],
                                    child: Text(data['title']));
                              }).toList(),
                            ],
                            onChanged: (value) {
                              print("selected Value $value");
                              setState(() {
                                defaultValue = value!;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isDense: true,
                            value: secondDropDown,
                            isExpanded: true,
                            menuMaxHeight: 350,
                            items: [
                              const DropdownMenuItem(
                                  child: Text(
                                    "Select Course",
                                  ),
                                  value: ""),
                              ...dropDownListData
                                  .map<DropdownMenuItem<String>>((data) {
                                return DropdownMenuItem(
                                    child: Text(data['title']),
                                    value: data['value']);
                              }).toList(),
                            ],
                            onChanged: (value) {
                              print("selected Value $value");
                              setState(() {
                                secondDropDown = value!;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AppDataController>(builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MultiSelectDialogField(
                          //height: 200,
                          items: controller.dropDownData,
                          title: const Text(
                            "Select Subject",
                            style: TextStyle(color: Colors.black),
                          ),
                          selectedColor: Colors.black,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          buttonText: const Text(
                            "Select Your Subject",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (results) {
                            subjectData = [];
                            for (var i = 0; i < results.length; i++) {
                              SubjectModel data = results[i] as SubjectModel;
                              print(data.subjectId);
                              print(data.subjectName);
                              subjectData.add(data.subjectId);
                            }
                            print("data $subjectData");

                            //_selectedAnimals = results;
                          },
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
