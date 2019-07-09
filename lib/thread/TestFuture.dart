import 'dart:async' as async;

/**
 *
    使用Future类，可以将任务加入到Event Queue的队尾
    使用scheduleMicrotask函数，将任务加入到Microtask Queue队尾

    当使用EventQueue时，需要考虑清楚，尽量避免microtask queue过于庞大，否则会阻塞其他事件的处理
 */

///异步任务处理
void main() {
//  FutureTest().test();//直接调用创建future对象
//  FutureDelayTest().test();//延迟执行
  AsyncTest().test();//microtask
}

class AsyncTest {
  void test() {
    async.scheduleMicrotask(() => run());
  }

  void run() {
    print("AsyncTest run()");
  }
}

class FutureDelayTest {
  void test() {
    Future.delayed(Duration(seconds: 3), () => run()).whenComplete(() {
      print("runDelayed compeletely!");
    });
  }

  void run() {
    print("run() after 3 sconds!");
  }
}

class FutureTest {
  void test() {
    Future(() => run()).then((value) {
      //参数传递 普通方法
      print(value);
      return value += 1;
    }).then((value) {
      //参数传递 普通方法
      print(value);
      return value += 1;
    }).whenComplete(() {
      //线程和then方法都执行完成才执行  普通方法
      print("Thread is compeletely!");
    }).timeout(Duration(seconds: 3));
  }

//异步方法
  int run() {
    print("run()");
    return 10;
  }
}
