/// 对象类型比较操作符
/**
 * Type test operators（类型判定操作符）

    as、 is、 和 is! 操作符是在运行时判定对象 类型的操作符：
    操作符 	解释
    as 	类型转换
    is 	如果对象是指定的类型返回 True
    is! 	如果对象是指定的类型返回 False
**/

// 1.
//  if (emp is Person) { // Type check
//    emp.firstName = 'Bob';
//  }

//  (emp as Person).firstName = 'Bob';

//  注意： 上面这两个代码效果是有区别的。如果 emp 是 null 或者不是 Person 类型， 则第一个示例使用 is 则不会执行条件里面的代码，
//  而第二个情况使用 as 则会抛出一个异常。


// 2.
//Assignment operators（赋值操作符）
//
//使用 = 操作符来赋值。 但是还有一个 ??= 操作符用来指定 值为 null 的变量的值。
//
//a = value;   // 给 a 变量赋值
//b ??= value; // 如果 b 是 null，则赋值给 b；
// 如果不是 null，则 b 的值保持不变


//3.
//Cascade notation (..)（级联操作符）
//
//级联操作符 (..) 可以在同一个对象上 连续调用多个函数以及访问成员变量。 使用级联操作符可以避免创建 临时变量， 并且写出来的代码看起来 更加流畅：
//
//例如下面的代码：
//
//querySelector('#button') // Get an object.
//..text = 'Confirm'   // Use its members.
//..classes.add('important')
//..onClick.listen((e) => window.alert('Confirmed!'));
//
//级联调用也可以嵌套：
//
//final addressBook = (new AddressBookBuilder()
//..name = 'jenny'
//..email = 'jenny@example.com'
//..phone = (new PhoneNumberBuilder()
//           ..number = '415-555-0100'
//           ..label = 'home')
//                .build())
//    .build();


//4.
//Other operators（其他操作符）
//
//下面是其他操作符：
//Operator 	Name 	Meaning
//() 	使用方法 	代表调用一个方法
//[] 	访问 List 	访问 list 中特定位置的元素
//    . 	访问 Member 	访问元素，例如 foo.bar 代表访问 foo 的 bar 成员
//    ?. 	条件成员访问 	和 . 类似，但是左边的操作对象不能为 null，例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员
//
//关于 .、 ?.、和 .. 的详情，请参考 Classes。

