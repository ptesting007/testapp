class LoginModel {
  LoginModel({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn, 
      this.refreshToken,});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
  }
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['refresh_token'] = refreshToken;
    return map;
  }

}