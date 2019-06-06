/// 抽象类 矢量类 接口


void main() {
  test3();
}

///接口
void test3() {
  print(new Student("lili",13).toString());
}

class Student implements Person {
  String _name = "";
  int _age= 0;
  Student(this._name,this._age);

  toString() => "name is $_name,$_age years old";
}

///每个类都隐式的定义了一个包含所有实例成员的接口， 并且这个类实现了这个接口
class Person {
  String _name;
  int _age;
  Person(this._name,this._age);

  toString() => "name is $_name,$_age years old";
}



///矢量类操作
void test2() {
  var v = new Vector(1,2);
  var v1= new Vector(1,2);
  print(v.x);
  print((v1+v).x);
}

///矢量类
class Vector {
  final int x;
  final int y;

  const Vector(this.x,this.y);

  Vector operator +(Vector v){
    return new Vector(x+v.x,y+v.y);
  }

}


///抽象类调试
void test() {
  print(new RealDo().sub(12.3,5.1));
}

///普通类
class RealDo extends Doer {
  sub (var x,var y){
    return x-y;
  }
}

///抽象类
abstract class Doer {
  //抽象方法，不用实现，不用写返回类型
  sub(var x,var y);
  //普通方法
  int add(int x,int y){
    return x+y;
  }
}
