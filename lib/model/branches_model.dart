

import 'dart:convert';

BranchModel branchModelFromJson(String str) => BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
    bool status;
    String message;
    List<Branches> branches;

    BranchModel({
        required this.status,
        required this.message,
        required this.branches,
    });

    factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        status: json["status"],
        message: json["message"],
        branches: List<Branches>.from(json["branches"].map((x) => Branches.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
    };
}

class Branches {
    int id;
    String name;
    int patientsCount;
    String location;
    String phone;
    String mail;
    String address;
    String gst;
    bool isActive;

    Branches({
        required this.id,
        required this.name,
        required this.patientsCount,
        required this.location,
        required this.phone,
        required this.mail,
        required this.address,
        required this.gst,
        required this.isActive,
    });

    factory Branches.fromJson(Map<String, dynamic> json) => Branches(
        id: json["id"],
        name: json["name"],
        patientsCount: json["patients_count"],
        location: json["location"],
        phone: json["phone"],
        mail: json["mail"],
        address: json["address"],
        gst: json["gst"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location": location,
        "phone": phone,
        "mail": mail,
        "address": address,
        "gst": gst,
        "is_active": isActive,
    };
}
