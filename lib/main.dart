import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    const List<String> CatImageList=[
      'assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png'
    ];
    const List<String> CatNameList=[
      '挪威森林貓','孟買貓','波斯貓','緬甸貓','英國短毛貓','蘇格蘭摺耳貓'
    ];
    const List<String> PopularCatImageList=[
      'assets/a.jpg','assets/b.jpg','assets/c.jpg','assets/d.jpg','assets/e.jpg','assets/1.png'
    ];
    const List<String> PopularCatNameList=[
      '布偶貓','孟加拉貓','喜馬拉雅貓','新加坡貓','達羅貓','挪威森林貓'
    ];

    return DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.dehaze),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
            title: Text("哈拉區"),
            actions: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.search),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.volume_up),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: null,
              )
            ],
            bottom: TabBar(
              tabs: tabList.map((choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
              children: tabList.map((choice) {
            return ListView.builder(
                itemCount: 6,itemBuilder: (context, idx) {
              if (choice.title == "我的看板") {
                return Container(
                    color: Colors.black12,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(CatImageList[idx])
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              CatNameList[idx],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(" ${CatNameList[idx]}真可愛!!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ));
              } else if (choice.title == "熱門看板") {
                return Container(
                    color: Colors.black12,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(PopularCatImageList[idx])
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              PopularCatNameList[idx],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(" ${PopularCatNameList[idx]}真可愛!!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ));
              } else {
                return Container(
                    color: Colors.black12,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: const AssetImage('assets/3.jpg'),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "魔物獵人",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(" 心得:還敢下來阿冰鳥?!",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ));
              }
            });
          }).toList()),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Hunter'),
                  accountEmail: Text('a124377172@gmail.com'),
                  currentAccountPicture: Image.asset('assets/1.jpg'),
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('稍後觀看'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('我的收藏'),
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('我的信箱'),
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.flag),
                  title: Text('公會叭啦'),
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.videogame_asset),
                  title: Text('熱門手遊'),
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_basket),
                  title: Text('勇者福利社'),
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('動態牆'),backgroundColor:Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('GNN'),backgroundColor:Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.child_care), title: Text('哈啦區'),backgroundColor:Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_to_photos), title: Text('創作大廳'),backgroundColor:Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text('勇者'),backgroundColor:Colors.grey),
            ],
            onTap: _onItemTap,

            // 不加這個會顯示不全
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}

//點擊底部按鈕 toast
void _onItemTap(int index) {
  Fluttertoast.showToast(
      msg: "Toast提示信息=>$index",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0
  );
}

class TabChoice {
  final String title;
  const TabChoice(this.title);
}

List<TabChoice> tabList = <TabChoice>[
  TabChoice('我的看板'),
  TabChoice('熱門看板'),
  TabChoice('熱門話題'),
];





