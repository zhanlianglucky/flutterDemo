

void main() {
  test();
  test2();
  test3();
}

///构造函数代理调试
void test3() {
  var p = Point.alongXAxis(3);
  var p2 = new Point(5,6);
  print(p.toString());
  print(p2.toString());
}

class Point {
  num x;
  num y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  Point.alongXAxis(num x) : this(x, 0);

  toString()=> "x = $x , y = $y";
}



///构造函数普通处理
void test2(){
  var equipment = new Equipment(12,13);
  print("width = ${equipment.width} ; height = ${equipment.height}");
}

class Equipment {
  int width;
  int height;

  Equipment(this.width,this.height);
}


void test(){
  var list = [1,2,3,4];
  list.forEach((i){
//    print(list[i-1]);
    print(list.indexOf(i).toString()+" : $i");
  });

  for(int i = 0;i<4;i++){
    print(list[i]);
  }

  print(new S() is T);
}

class S extends T {
}

class T {
  int a;
}


String getStr(String str,[String str2]) {
  return 'str = $str,str2 = $str2';
}