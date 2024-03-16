
import 'dart:convert';

TreatmentListModel treatmentListModelFromJson(String str) => TreatmentListModel.fromJson(json.decode(str));

String treatmentListModelToJson(TreatmentListModel data) => json.encode(data.toJson());

class TreatmentListModel {
    bool status;
    String message;
    List<Treatment> treatments;

    TreatmentListModel({
        required this.status,
        required this.message,
        required this.treatments,
    });

    factory TreatmentListModel.fromJson(Map<String, dynamic> json) => TreatmentListModel(
        status: json["status"],
        message: json["message"],
        treatments: List<Treatment>.from(json["treatments"].map((x) => Treatment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "treatments": List<dynamic>.from(treatments.map((x) => x.toJson())),
    };
}

class Treatment {
    int id;
    List<Branch> branches;
    String name;
    String duration;
    String price;
    bool isActive;
    DateTime createdAt;
    DateTime updatedAt;

    Treatment({
        required this.id,
        required this.branches,
        required this.name,
        required this.duration,
        required this.price,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
        id: json["id"],
        branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
        name: json["name"],
        duration: json["duration"],
        price: json["price"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
        "name": name,
        "duration": duration,
        "price": price,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Branch {
    int id;
    String name;
    int patientsCount;
    String location;
    String phone;
    String mail;
    String address;
    String gst;
    bool isActive;

    Branch({
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

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name:json["name"],
        patientsCount: json["patients_count"],
        location:json["location"],
        phone: json["phone"],
        mail:json["mail"],
        address:json["address"],
        gst: json["gst"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location":location,
        "phone":phone,
        "mail":mail,
        "address":address,
        "gst": gst,
        "is_active": isActive,
    };
}













