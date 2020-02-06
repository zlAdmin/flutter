class UserInfo {
  String username;
  int id;
  String avatarPic;
  String themeColor;

  UserInfo({
    this.avatarPic,
    this.id,
    this.themeColor,
    this.username,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    print('fromJOSN $json   ${json['id'].runtimeType}');
    String name = json['name'];
    int userId;
    if (json['name'] == null) {
      name = json['url_name'];
    }
    if (json['id'].runtimeType == int) {
      userId = json['id'];
    } else {
      userId = int.parse(json['id']);
    }
    return UserInfo(
        avatarPic: json['avatar_pic'],
        id: userId,
        username: name,
        themeColor: json['theme_color']);
  }
}