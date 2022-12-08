class Users {
  final id;
  final String name;
  final String email;
  final String whatapp;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final List MachineData;
  final List CropsData;
  final List FarmData;
  final List CattlesData;
  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.whatapp,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.MachineData,
    required this.CropsData,
    required this.FarmData,
    required this.CattlesData,
  });

  static Users fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      whatapp: json['whatapp'],
      address: json['whatapp'],
      pincode: json['pincode'],
      city: json['city'],
      state: json['state'],
      MachineData: json['MachineData'],
      CropsData: json['CropsData'],
      FarmData: json['FarmData'],
      CattlesData: json['CattlesData']);
}
