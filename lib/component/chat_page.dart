import 'package:app_whats_app/modal/modal_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  List<Chat> chats;
  ChatPage({this.chats}) : super();
  @override
  State<StatefulWidget> createState() {
    return _StateChat();
  }
}

class _StateChat extends State<ChatPage>{

  Widget _buildList(int index){
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(widget.chats.elementAt(index).img),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(widget.chats.elementAt(index).title, style: TextStyle(color: Colors.black, fontSize: 25),),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                child: Text(widget.chats.elementAt(index).time, style: TextStyle(fontSize: 16),),
              )
            ],
          ),
          subtitle: Text(
              widget.chats.elementAt(index).content
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.chats == null
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (context, index){
          return _buildList(index);
        },
    );
  }
}