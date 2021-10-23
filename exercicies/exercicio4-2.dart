import 'exercicio4-1.dart';

class Car extends Vehicle {
  Car(String brand, String model) : super(brand, model);

  horn() => print("pom");
}

class EletrictCar extends Vehicle with Autonomous {
  EletrictCar(String brand, String model) : super(brand, model);

  horn() => print("π");
}

class MotorCycle extends Vehicle {
  MotorCycle(String brand, String model) : super(brand, model);

  horn() => print("bi");
}

main() {
  var car = Car("Ford", "Fiesta");
  car..accelerate()..accelerate()..accelerate()..accelerate();

  car.horn();
  car.trace();

  print("## -- ##");

  var motorCycle = MotorCycle("Honda", "CBR");
  motorCycle.horn();
  motorCycle.trace();

  print("## -- ##");

  var eletrictCar = EletrictCar("Tesla", "Model S");
  eletrictCar.horn();
  eletrictCar.selfDrive();
  eletrictCar.trace();
}
