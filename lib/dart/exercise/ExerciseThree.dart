///list map

void main() {
//   test();
//   test2();
  test3();
}

void test3() {
  var map = Map<int,String>();
  map[0] = "hi";
  map[1] = "ha";
  print(map[1]);
}

void test2() {
  var list = new List<String>();
  list.add("a");
  list.add("b");
  print(list.toString());
}


void test(){
  var list = <int>[1,2,3];
  for(int i = 0;i<list.length;i++){
    print(list[i]);
  }
}
