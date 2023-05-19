class NurseModel {
  String? name;
  double? rating;
  String? timeAvailable;
  bool? idle;
  int? nurseID;
  String? location;
  int? price;

  NurseModel(
      {this.name,
      this.rating,
      this.timeAvailable,
      this.idle,
      this.nurseID,
      this.location,
      this.price});

  NurseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    timeAvailable = json['timeAvailable'];
    idle = json['idle'];
    nurseID = json['id'];
    location = json['location'];
    price = json['price'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rating': rating,
      'timeAvailable': timeAvailable,
      'idle': idle,
      'id': nurseID,
      'location': location,
      'price': price,
    };
  }
}
