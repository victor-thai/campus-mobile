import 'dart:convert';

VentilationModel ventilationModelFromJson(String str) =>
    VentilationModel.fromJson(json.decode(str));

String ventilationModelToJson(VentilationModel data) =>
    json.encode(data.toJson());

class VentilationModel {
  VentilationModel({
    this.buildingName,
    this.buildingFloorName,
    this.buildingRoomName,
    this.currentTemperature,
    this.windowsOpen,
    this.hvacActive,
  });

  String? buildingName;
  String? buildingFloorName;
  String? buildingRoomName;
  String? currentTemperature;
  bool? windowsOpen;
  bool? hvacActive;

  factory VentilationModel.fromJson(Map<String, dynamic> json) =>
      VentilationModel(
        buildingName:
            json["BuildingName"] == null ? null : json["BuildingName"],
        buildingFloorName: json["BuildingFloorName"] == null
            ? null
            : json["BuildingFloorName"],
        buildingRoomName:
            json["BuildingRoomName"] == null ? null : json["BuildingRoomName"],
        currentTemperature: json["CurrentTemperature"] == null
            ? null
            : json["CurrentTemperature"],
        windowsOpen: json["WindowsOpen"] == null ? null : json["WindowsOpen"],
        hvacActive: json["HVACActive"] == null ? null : json["HVACActive"],
      );

  Map<String, dynamic> toJson() => {
        "BuildingName": buildingName == null ? null : buildingName,
        "BuildingFloorName":
            buildingFloorName == null ? null : buildingFloorName,
        "BuildingRoomName": buildingRoomName == null ? null : buildingRoomName,
        "CurrentTemperature":
            currentTemperature == null ? null : currentTemperature,
        "WindowsOpen": windowsOpen == null ? null : windowsOpen,
        "HVACActive": hvacActive == null ? null : hvacActive,
      };
}
