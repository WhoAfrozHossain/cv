import 'package:cv/network/models/info_model.dart';
import 'package:cv/network/models/job_model.dart';
import 'package:cv/network/models/platform_model.dart';
import 'package:cv/network/models/social_model.dart';

class AllDataModel {
  bool? success;
  String? message;
  Data? data;

  AllDataModel({this.success, this.message, this.data});

  AllDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  InfoModel? info;
  List<JobModel>? job;
  List<PlatformModel>? platform;
  List<SocialModel>? social;

  Data({this.info, this.job, this.platform, this.social});

  Data.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? InfoModel.fromJson(json['info']) : null;
    if (json['job'] != null) {
      job = <JobModel>[];
      json['job'].forEach((v) {
        job!.add(JobModel.fromJson(v));
      });
    }
    if (json['platform'] != null) {
      platform = <PlatformModel>[];
      json['platform'].forEach((v) {
        platform!.add(PlatformModel.fromJson(v));
      });
    }
    if (json['social'] != null) {
      social = <SocialModel>[];
      json['social'].forEach((v) {
        social!.add(SocialModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (job != null) {
      data['job'] = job!.map((v) => v.toJson()).toList();
    }
    if (platform != null) {
      data['platform'] = platform!.map((v) => v.toJson()).toList();
    }
    if (social != null) {
      data['social'] = social!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}