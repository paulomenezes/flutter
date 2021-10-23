import 'exercicio4-1.dart';

class Car extends Vehicle {
  horn() {
    print("pom");
  }
}

class EletrictCar extends Vehicle with Autonomous {
  horn() {
    print("π");
  }
}

class MotorCycle extends Vehicle {
  horn() {
    print("bi");
  }
}

main() {
  var car = Car();
  car.accelerate();
  car.accelerate();
  car.accelerate();
  car.accelerate();

  print(car.currentSpeed);
  car.horn();

  var motorCycle = MotorCycle();
  motorCycle.horn();

  var eletrictCar = EletrictCar();
  eletrictCar.horn();
  eletrictCar.selfDrive();
}
