main() {
  List<double> notas = [1,2,3,6,7,8,9,7.6,8.7,8.9,9.6];

  print(isHighGrade(notas));
}

isHighGrade(List<double> notas) {
  return notas.where((nota) => nota >= 8.5);
}