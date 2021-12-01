import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with
SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> _tabs = ["Home", "Category", "Report"];
  @override void initState(){
    super.initState();

    _tabController = new TabController(length: _tabs.length, vsync: this);    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.category)),
            Tab(icon: Icon(Icons.report)),
          ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Center(
            child: Text(
              "Category",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Center(
            child: Text(
              "Report",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ]),
    );
  }
}