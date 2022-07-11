class CardModel {
  late String name, price, image, quntity, id;

  CardModel({
    required this.price,
    required this.name,
    required this.image,
    required this.quntity,
  });

  CardModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    price = map['price'];
    name = map['name'];
    image = map['image'];
    quntity = map['quntity'];
  }
  tojson() {
    return {
      'price': price,
      'image': image,
      'name': name,
      'quntity': quntity,
    };
  }
}
