import 'package:swishapp/api/stream_api.dart';
import 'package:swishapp/config/config.dart';
import 'package:swishapp/pages/channel_list_page.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/*
Future main() async {
  final client = Client(Config.apiKey, logLevel: Level.SEVERE);

  await StreamApi.initUser(
    client,
    username: 'Emily',
    urlImage:
        'https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png',
    id: Config.idEmily,
    token: Config.tokenEmily,
  );

//  await StreamApi.initUser(
//    client,
//    username: 'Peter',
//    urlImage:
//        'https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg',
//    id: Config.idPeter,
//    token: Config.tokenPeter,
//  );

//  final channel = await StreamApi.createChannel(
//    client,
//    type: 'messaging',
//    id: 'sample2',
//    name: 'Family',
//    image:
//        'https://image.freepik.com/fotos-kostenlos/glueckliche-familie-in-einer-reihe-liegen_1098-1101.jpg',
//    idMembers: [Config.idEmily, Config.idPeter],
//  );

  final channel = await StreamApi.watchChannel(
    client,
    type: 'messaging',
    id: 'sample',
  );

  runApp(MyApp1(client: client, channel: channel));
}

class MyAppStream1 extends StatelessWidget {
  final Client client;
  final Channel channel;

  const MyAppStream1({Key key, this.client, this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomeStreamPage(
          title: 'Stream Chat', client: client, channel: channel),
    );
  }
}*/

class MyHomeStreamPage extends StatefulWidget {
  final Client client;
  final Channel channel;

  MyHomeStreamPage({Key key, this.title, this.client, this.channel})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeStreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamChat(
        streamChatThemeData: StreamChatThemeData(
          otherMessageTheme: MessageTheme(
            messageText: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          ownMessageTheme: MessageTheme(
            messageText: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            avatarTheme: AvatarTheme(
              constraints: BoxConstraints(maxWidth: 80, maxHeight: 80),
              borderRadius: BorderRadius.circular(120),
            ),
          ),
        ),
        child: ChannelListPage(),
        client: widget.client,
      ),
    );
  }
}
