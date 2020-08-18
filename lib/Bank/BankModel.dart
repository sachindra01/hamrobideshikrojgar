class BankModel {
  String description, iconUrl, location, title, number;

  List<String> photos;

  BankModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.title,
      this.number});
}
