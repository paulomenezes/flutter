mixin Autonomous on Vehicle {
  selfDrive() {
    print("self driving");
  }
}

abstract class Vehicle {
  int _currentSpeed = 0;

  get currentSpeed => _currentSpeed;

  String brand;
  String model;
  int? year;

  Vehicle(this.brand, this.model, [this.year]);

  accelerate() {
    _currentSpeed += 5;
  }

  horn();

  trace() {
    print(currentSpeed);
    print(brand);
    print(model);
    print(year);
  }
}
