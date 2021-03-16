class BoxScaffold {
  String boxName;
  String translateFromLanguage;
  String translateToLanguage;
  int fillGrade;

  BoxScaffold(
      this.boxName, this.translateFromLanguage, this.translateToLanguage,
      [this.fillGrade = 0]);

  BoxScaffold.fromMap(Map map) {
    this.boxName = map['boxName'];
    this.translateFromLanguage = map['translateFromLanguage'];
    this.translateToLanguage = map['translateToLanguage'];
    this.fillGrade = map['fillGrade'];
  }

  Map toMap() {
    return {
      'boxName': this.boxName,
      'translateFromLanguage': this.translateFromLanguage,
      'translateToLanguage': this.translateToLanguage,
      'fillGrade': this.fillGrade,
    };
  }
}
