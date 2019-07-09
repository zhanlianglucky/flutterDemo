
/// async 修饰方法，await 修饰方法内的异步耗时操作
void main() {
  run();
}

 run() async {
  await getCount();
}

//异步方法
 getCount() {
  int count = 0;
  for(int i = 0;i<100;i++){
    count += i;
  }
  print("count = $count");
}

