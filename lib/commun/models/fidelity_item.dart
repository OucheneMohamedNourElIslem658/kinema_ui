class FidelityItem {
  int? id;
  String? description;
  String? name;
  String? type;
  int? pointsPrice;
  String? imgurl;

  FidelityItem({
    this.id,
    this.description,
    this.name,
    this.type,
    this.pointsPrice,
    this.imgurl,
  });

  factory FidelityItem.fromJson(Map<String, dynamic> json) => FidelityItem(
    id: json["id"],
    description: json["description"],
    name: json["name"],
    type: json["merch_type"],
    pointsPrice: json["points_price"],
    imgurl: json["imgurl"],
  );
}
