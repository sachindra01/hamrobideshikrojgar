class Language {
  int id;
  String name;
  String languageCode;

  Language(this.id, this.name, this.languageCode);

  List<Language> getLanguages() {
    return <Language>[
      Language(1, 'English', 'en'),
      Language(2, 'नेपाली', 'ne'),
    ];
  }
}
