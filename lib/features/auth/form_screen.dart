import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishicare/constants/global_variable.dart';
import 'package:krishicare/datas/controller/app_data_controller2.dart';
import 'package:krishicare/datas/controller/app_data_controller3.dart';
import 'package:krishicare/datas/controller/app_data_controller4.dart';
import 'package:krishicare/pages/onboarding_screen.dart';
import 'package:krishicare/provider/phone_provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import '../../datas/User.dart';
import '../../datas/controller/app_data_controller1.dart';
import '../../datas/model/subject_data_model.dart';

class MainFormScreen extends StatefulWidget {
  var phoneNumber = 123;
  final phone;

  MainFormScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainFormScreenState();
  }
}

class MainFormScreenState extends State<MainFormScreen> {
  late String name;
  late String email;
  late String address;
  late String pincode;
  late String whatapp;
  late String city;
  late String state;
  List<String> vegetable = [];

  //late String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppDataController1 controller1 = Get.put(AppDataController1());
  final AppDataController2 controller2 = Get.put(AppDataController2());
  final AppDataController3 controller3 = Get.put(AppDataController3());
  final AppDataController4 controller4 = Get.put(AppDataController4());

  List dropDownListStateData = [
    {"title": "Madhya Pradesh", "value": "1"},
    {"title": "Uttar Pradesh", "value": "2"},
    {"title": "West Bengal", "value": "3"},
    {"title": "Maharashtra", "value": "4"},
  ];
  List dropDownListCityData = [
    {"title": "Bhopal", "value": "1"},
    {"title": "Indore", "value": "2"},
    {"title": "Ujjain", "value": "3"},
    {"title": "Gwalior", "value": "4"},
  ];

  String defaultValue = "";
  String secondDropDown = "";
  String text1 = "";

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      maxLength: 20,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
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
        email = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: ' Whatapp number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Whatapp number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        whatapp = value!;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Address'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        address = value!;
      },
    );
  }

  Widget _buildPinCode() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Pin Code'),
      maxLength: 6,
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Pin Code is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        pincode = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List CropsData = [];
    List MachineData = [];
    List FarmData = [];
    List CattlesData = [];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller1.getSubjectData();
      controller2.getSubjectData();
      controller3.getSubjectData();
      controller4.getSubjectData();
    });

    bool isLoading = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.secondaryColor,
        title: const Text("Kissan Deatils"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                const SizedBox(height: 15),
                _buildPhoneNumber(),
                const SizedBox(height: 15),
                _buildAddress(),
                const SizedBox(height: 15),
                _buildPinCode(),
                const SizedBox(height: 30),
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
                              value: "",
                              child: Text(
                                "Select Your State",
                              )),
                          ...dropDownListStateData
                              .map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                value: data['title'],
                                child: Text(data['title']));
                          }).toList(),
                        ],
                        onChanged: (value) {
                          print("selected Value $value");
                          state = ('$value');
                          setState(() {
                            defaultValue = value!;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 30),

                //////////////////
                InputDecorator(
                  // String xyz;
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
                            value: "",
                            child: Text(
                              "Select Your City",
                            ),
                          ),
                          ...dropDownListCityData
                              .map<DropdownMenuItem<String>>((data) {
                            return DropdownMenuItem(
                                value: data['title'],
                                //: data['title'],
                                child: Text(data['title']));
                          }).toList(),
                        ],
                        onChanged: (value) {
                          //print("selected Value $title");
                          print("selected Value $value");
                          city = ('$value');
                          setState(() {
                            secondDropDown = value!;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 30),
                ///////////////////////

                //////////////////////////////
                GetBuilder<AppDataController1>(builder: (controller1) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MultiSelectDialogField(
                      //height: 200,
                      items: controller1.dropDownData,
                      title: const Text(
                        "Select Your Crops",
                        style: TextStyle(color: Colors.black),
                      ),
                      selectedColor: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      buttonText: const Text(
                        "Select Your Crops",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        CropsData = [];
                        for (var i = 0; i < results.length; i++) {
                          SubjectModel data = results[i] as SubjectModel;
                          print(data.subjectId);
                          print(data.subjectName);
                          CropsData.add(data.subjectName);
                        }
                        print("data $CropsData");
                        //vegetable = ('$subjectData') ;
                        //print("data $vegetable");
                        //print('1');

                        //_selectedAnimals = results;
                      },
                    ),
                  );
                }),
                const SizedBox(height: 30),
                //////////////////////////
                GetBuilder<AppDataController2>(builder: (controller2) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MultiSelectDialogField(
                      //height: 200,
                      items: controller2.dropDownData,
                      title: const Text(
                        "Select Your Machines",
                        style: TextStyle(color: Colors.black),
                      ),
                      selectedColor: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      buttonText: const Text(
                        "Select Your Machines",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        MachineData = [];
                        for (var i = 0; i < results.length; i++) {
                          SubjectModel data = results[i] as SubjectModel;
                          print(data.subjectId);
                          print(data.subjectName);
                          MachineData.add(data.subjectName);
                        }
                        print("data $MachineData");

                        //_selectedAnimals = results;
                      },
                    ),
                  );
                }),
                const SizedBox(height: 30),
                //////////////////////
                GetBuilder<AppDataController3>(builder: (controller3) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MultiSelectDialogField(
                      //height: 200,
                      items: controller3.dropDownData,
                      title: const Text(
                        "Select Your Farm Area",
                        style: TextStyle(color: Colors.black),
                      ),
                      selectedColor: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      buttonText: const Text(
                        "Select Your Farm Area",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        FarmData = [];
                        for (var i = 0; i < results.length; i++) {
                          SubjectModel data = results[i] as SubjectModel;
                          print(data.subjectId);
                          print(data.subjectName);
                          FarmData.add(data.subjectName);
                        }
                        print("data $FarmData");

                        //_selectedAnimals = results;
                      },
                    ),
                  );
                }),
                const SizedBox(height: 30),
                //////////////////////////////////
                GetBuilder<AppDataController4>(builder: (controller4) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MultiSelectDialogField(
                      //height: 200,
                      items: controller4.dropDownData,
                      title: const Text(
                        "Select Your Cattles",
                        style: TextStyle(color: Colors.black),
                      ),
                      selectedColor: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      buttonText: const Text(
                        "Select Your Cattles",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        CattlesData = [];
                        for (var i = 0; i < results.length; i++) {
                          SubjectModel data = results[i] as SubjectModel;
                          print(data.subjectId);
                          print(data.subjectName);
                          CattlesData.add(data.subjectName);
                        }
                        print("data $CattlesData");

                        //_selectedAnimals = results;
                      },
                    ),
                  );
                }),
                ////////////////////////////
                //_buildCalories(),
                const SizedBox(height: 100),
                Column(
                  children: [
                    ChangeNotifierProvider<PhoneProvider>(
                        create: (context) => PhoneProvider(),
                        child: Consumer<PhoneProvider>(
                          builder: (context, provider, child) {
                            return ElevatedButton(
                              child: Text(
                                'Submit'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                ;

                                //Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot)=>snapshot.docs.map((doc)=>User.fromJson(doc.data())).toList());

                                _formKey.currentState!.save();

                                await createUser(
                                    name: name,
                                    id: widget.phone,
                                    email: email,
                                    whatapp: whatapp,
                                    address: address,
                                    pincode: pincode,
                                    city: city,
                                    state: state,
                                    MachineData: MachineData,
                                    CropsData: CropsData,
                                    FarmData: FarmData,
                                    CattlesData: CattlesData);
                                print(readUser());

                                print(name);
                                print(email);
                                print(whatapp);
                                print(address);
                                print(pincode);

                                //Send to API
                              },
                            );
                          },
                        )),
                    //SizedBox(height: 100);
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser({
    required id,
    required String name,
    required String email,
    required String whatapp,
    required String address,
    required String pincode,
    required String city,
    required String state,
    required List MachineData,
    required List CropsData,
    required List FarmData,
    required List CattlesData,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    print("data sending");
    final json = {
      'phone': id,
      'time': Timestamp.now(),
      'name': name,
      'email': email,
      'whatapp': whatapp,
      'address': address,
      'pincode': pincode,
      'city': city,
      'state': state,
      'MachineData': MachineData,
      'CropsData': CropsData,
      'FarmData': FarmData,
      'CattlesData': CattlesData
    };
    await docUser.set(json);
    print("data sent");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => OnBoardingPage()));
  }

  Future<Users?> readUser() async {
    final docUser = FirebaseFirestore.instance
        .collection("users")
        .doc((widget.phone).toString());
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Users.fromJson(snapshot.data()!);
      final user = snapshot.data();

      //print(User.id);
    }
  }
}





/*
Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot)=>snapshot.docs.map((doc)=>User.fromJson(doc.data())).toList());


static User fromJson (Map<String,dynamic> json) => User(
  id:json['id'],
  name:json['name'],

)

to print
body: StreamBuilder<List<User>>(
  stream:readUsers(),
  builder: (comtext,ssnapshot){
    if(snapshot.hasData){
      final users=snapshot.data!;

      return listView()
      children:Users.map().toList(),
      ))
    }
  }
)
widget buildUser(User user)=> LisTile(
  leading:
  title :Text(user.name),
  suntitle: Texf(user.birthday.toIso8601String()),)
)

one user

body:FutureBuilder<User?>(
  future: readUser(),
  builder: (context,snapshot){},
)

Future<User?> readUser({required String name })async{
  final docUser= FirebaseFirestore.instance.collection("users").doc('id');
  final snapshot = await docUser.get();

  if(snapshot.exists){
    return User.fromJson(snapshot.data()!);
  
}

update data
docUser.update({
  'name':'Emma',
  for list type
  'city.name':'Surat'
}
)

delete data
docUser.update({
  'name':'Emma',
  for list type
  'city.name':FieldValue.delete(),
}
)

delete document 
docUser.delete();
 

 


*/
