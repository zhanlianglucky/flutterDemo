import 'package:flutter/material.dart';

///shopping cart
void main() =>runApp(
  new MaterialApp(
    title: "shopping cart",
    home: new GoodsListWidget(
      products: <Product>[
        new Product(goodsName: 'apple',isInShopCart: false),
        new Product(goodsName: 'pear',isInShopCart: false),
        new Product(goodsName: 'orange',isInShopCart: false),
      ],
    ),
  )
);

class Product {
  String goodsName;
  bool isInShopCart;
  Product({this.goodsName,this.isInShopCart});
}

///列表
class GoodsListWidget extends StatefulWidget {
  GoodsListWidget({this.products});
  final List<Product> products;

  @override
  State<StatefulWidget> createState() => new GoodsListState();
}

///列表内容
class GoodsListState extends State<GoodsListWidget>{

  void _onItemClick(Product product) {
    setState(() {
      product.isInShopCart = !product.isInShopCart;
      print("是否加入购物车：${product.isInShopCart}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("shopping list"),
        backgroundColor: Colors.lightBlue,
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map(
            (Product product){
              return new ListViewItem(
                product:product,
                callBack:_onItemClick,
              );
            }
        ).toList(),
      ),
    );
  }
}

typedef void CartChangedCallBack(Product product);// typedef声明函数类型

///单列信息
class ListViewItem extends StatelessWidget{
  ListViewItem({this.product,this.callBack});
  final Product product;
  final CartChangedCallBack callBack;//单列点击事件

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: (){
        callBack(product);
      },
      leading: new CircleAvatar(//左侧圆形头部按钮，挺好用
        backgroundColor: product.isInShopCart?Colors.lightBlue:Colors.black,
        child: new Text(product.goodsName[0]),
      ),
      title: new Text(product.goodsName),
    );
  }
}


