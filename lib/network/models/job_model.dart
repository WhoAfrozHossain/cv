class JobModel {
  int? id;
  String? companyName;
  String? startDate;
  String? endDate;
  String? logo;
  String? createdAt;
  String? updatedAt;

  JobModel(
      {this.id,
      this.companyName,
      this.startDate,
      this.endDate,
      this.logo,
      this.createdAt,
      this.updatedAt});

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['logo'] = logo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}