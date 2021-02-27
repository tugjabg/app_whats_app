import 'package:flutter/material.dart';

import 'component/chat_page.dart';
import 'modal/fake_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> with TickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TabController _tabController = new TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('WhatsApp'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30.0,),
              Text(
                'Chats',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Status',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Calls',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Icon(Icons.camera),
            ),
            ChatPage(chats: listChat,),
            ChatPage(),
            ChatPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chat),
          onPressed: () {
            _tabController.animateTo(1);
          },
        ),
      ),
    );
  }
}