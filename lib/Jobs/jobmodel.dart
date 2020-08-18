class JobModel {
  String description, iconUrl, location, salary, title, number;
  List<String> photos;

  JobModel(
      {this.photos,
      this.number,
      this.description,
      this.iconUrl,
      this.location,
      this.salary,
      this.title});
}
