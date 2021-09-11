class CardModel {
  String header;
  String subHeader;
  String? subHeader2;
  String? imageUrl =
      "https://pidetucomida.es/wp-content/uploads/2017/02/the-ultimate-hamburger.jpg";
  String? buttonActionName = "Button";

  CardModel({
    required this.header,
    required this.subHeader,
    this.buttonActionName,
    this.imageUrl,
    this.subHeader2,
  }) {}
}
