class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.firstName, 
      this.lastName, 
      this.religion, 
      this.birthDate, 
      this.gender, 
      this.userImages,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    religion = json['religion'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    if (json['user_images'] != null) {
      userImages = [];
      json['user_images'].forEach((v) {
        userImages?.add(UserImages.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? religion;
  String? birthDate;
  String? gender;
  List<UserImages>? userImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['religion'] = religion;
    map['birth_date'] = birthDate;
    map['gender'] = gender;
    if (userImages != null) {
      map['user_images'] = userImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserImages {
  UserImages({
      this.id, 
      this.userId, 
      this.name, 
      this.path, 
      this.type, 
      this.createdAt, 
      this.updatedAt,});

  UserImages.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    path = json['path'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? name;
  String? path;
  String? type;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['path'] = path;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}