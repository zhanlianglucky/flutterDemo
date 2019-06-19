import 'package:flutter/material.dart';

///列表
void main() => runApp(new MaterialApp(
  title: "test list",
  home: new ListViewWidget(

    products:<Product>[//生成列表数据
      new Product(goodsName: "shoes",isSelected: false),
      new Product(goodsName: "T shirt",isSelected: false),
      new Product(goodsName: "coat",isSelected: false),
    ],
  ),
));

class Product {
  Product({this.goodsName,this.isSelected});
  String goodsName;
  bool isSelected;
}

class ListViewWidget extends StatefulWidget{
  ListViewWidget({this.products});
  final List<Product> products;

  @override
  State<StatefulWidget> createState() => new ListViewState();
}

class ListViewState extends State<ListViewWidget>{

  void _onItemClickListener(Product product){//item点击事件
    setState(() {//一定要加上更新数据的函数，否则不生效
      product.isSelected = !product.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("listview test"),//属性
        backgroundColor: Colors.lightBlue,
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
          return new ListViewItem(//listItem
            product: product,
            onItemClick: _onItemClickListener,
          );
        }).toList(),//生成列表
      ),
    );
  }
}

typedef void onListItemClick(Product product);//定义回调函数

class ListViewItem extends StatelessWidget {
  ListViewItem({this.product,this.onItemClick});
  Product product;//数据
  onListItemClick onItemClick;//给上层控件使用

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap:() {//item点击事件
        onItemClick(product);
      },
      leading: new CircleAvatar(
        backgroundColor: product.isSelected?Colors.lightBlue:Colors.black,
        child: new Text(product.goodsName[0]),
      ),
      title: new Text(product.goodsName),
    );
  }
}