class InsuranceModel {
  String description, iconUrl, location, title, number;

  List<String> photos;

  InsuranceModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.title,
      this.number});
}
