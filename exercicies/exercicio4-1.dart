mixin Autonomous on Vehicle {
  selfDrive() {
    print("self driving");
  }
}

abstract class Vehicle {
  int _currentSpeed = 0;

  get currentSpeed => _currentSpeed;

  accelerate() {
    _currentSpeed += 5;
  }

  horn();
}
