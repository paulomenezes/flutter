import "dart:io";

main() {
  drawTriangles(lines: 5, asc: true);

  print("--");

  drawTriangles(lines: 5, asc: false);

  print("--");

  drawTriangles(lines: 10);
}

drawTriangles({required int lines, bool? asc}) {
  if (asc != null && asc == false) {
    for (int i = lines - 1; i >= 0; i--) {
      drawInsideTriangles(i);
    }
  } else {
    for (int i = 0; i < lines; i++) {
      drawInsideTriangles(i);
    }
  } 
}

drawInsideTriangles(int size) {
  for (int j = 0; j < size + 1; j++) {
    stdout.write("*");
  }

  print("");
}