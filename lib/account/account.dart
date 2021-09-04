class Account {
  String name;
  String id;
  String imagepath;
  String selfIntroduction;
  String userId;
  DateTime? createdTime;
  DateTime? updatedTime;

  Account(
      {this.name = '',
      this.id = '',
      this.imagepath = '',
      this.selfIntroduction = '',
      this.userId = '',
      this.createdTime,
      this.updatedTime});
}
