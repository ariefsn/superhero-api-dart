class PowerStatsModel {
  final int intelligence, strength, speed, durability, power, combat, tier;

  PowerStatsModel({
    this.intelligence, this.strength, this.speed, this.durability, this.power, this.combat, this.tier
  });

  PowerStatsModel.fromJson(Map<String, dynamic> json)
    : intelligence = json["intelligence"],
      strength = json["strength"],
      speed = json["speed"],
      durability = json["durability"],
      power = json["power"],
      combat = json["combat"],
      tier = json["tier"];

  Map<String, dynamic> toJson() => {
    "intelligence":intelligence,
    "strength": strength,
    "speed": speed,
    "durability": durability,
    "power": power,
    "combat": combat,
    "tier": tier,
  };
}
