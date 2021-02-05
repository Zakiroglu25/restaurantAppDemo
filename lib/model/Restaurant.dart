class Restaurant {
  String res_id;
  double lat;
  double long;
  String res_address;
  String res_cabinet;
  String res_image_one;
  String res_instagram;
  String res_name;
  String res_phone_number;
  String res_about;
  double raiting;
  String open_res;
  String close_res;

  Restaurant(
      this.res_id,
      this.lat,
      this.long,
      this.res_address,
      this.res_cabinet,
      this.res_image_one,
      this.res_instagram,
      this.res_name,
      this.res_phone_number,
      this.raiting,
      this.open_res,
      this.close_res,
      this.res_about);

  factory Restaurant.fromJson(String key, Map<dynamic, dynamic> json) {
    return Restaurant(
        json["res_id"] as String,
        json["lat"] as double,
        json["long"] as double,
        json["res_address"] as String,
        json["res_cabinet"] as String,
        json["res_image_one"] as String,
        json["res_instagram"] as String,
        json["res_name"] as String,
        json["res_phone_number"] as String,
        json["raiting"] as double,
        json["close_res"] as String,
        json["open_res"] as String,
        json["res_about"] as String);
  }
}
