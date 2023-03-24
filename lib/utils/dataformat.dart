class Dataformat {
  Future<String?> formphone(String value) async {
    if (value.startsWith("0")) {
      String newsv = value.substring(
        1,
      );
      var phone254 = "254$newsv";
      return phone254;
    } else if (value.startsWith("2")) {
      String newsv = value.substring(
        1,
      );
      var phone254 = "2$newsv";
      return phone254;
    }
    return value;
  }

  Future<String?> formusername(String value) async {
    String? username = value.replaceAll(' ', '');
    return username.toLowerCase();
  }
}
