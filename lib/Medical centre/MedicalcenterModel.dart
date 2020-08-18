class MedicalcenterModel {
  String description, iconUrl, location, title, number;

  List<String> photos;

  MedicalcenterModel(
      {this.photos,
      this.description,
      this.iconUrl,
      this.location,
      this.title,
      this.number});
}
