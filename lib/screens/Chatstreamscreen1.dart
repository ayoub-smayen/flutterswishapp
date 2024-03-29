import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'package:swishapp/model/Chatstream.dart';
import 'package:swishapp/config/utils.dart';

//void main() => runApp(MyApp());

class ChatStreamScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatModel>(
      create: (context) => ChatModel(),
      child: MaterialApp(
        theme: ThemeData(),
        home: ChatHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ChatHome extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Chat App"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 400.0,
                child: Image.asset("images/logo.png"),
              ),
            ),
          ),
          CustomForm(
            controller: _controller,
            formKey: _formKey,
            hintText: "Enter a username..",
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                final user = _controller.value.text;
                final client = provider.client;

                await client.setUserWithProvider(
                  User(
                    id: "id_$user",
                    extraData: {
                      "name": "$user",
                      "image": "https://picsum.photos/100/100",
                    },
                  ),
                );

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => StreamChat(
                      child: ChannelView(),
                      client: client,
                    ),
                  ),
                );
              }
            },
            text: "Submit",
          ),
        ],
      ),
    );
  }
}

class ChannelView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final channels = List<Channel>();

  Future<List<Channel>> getChannels(StreamChatState state) async {
    final filter = {
      "type": "mobile",
    };

    final sort = [
      SortOption(
        "last_message_at",
        direction: SortOption.DESC,
      ),
    ];

    return await state.client.queryChannels(
      filter: filter,
      sort: sort,
    );
  }

  @override
  Widget build(BuildContext context) {
    final streamchat = StreamChat.of(context);
    final client = streamchat.client;
    final provider = Provider.of<ChatModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Channel List"),
        backgroundColor: Colors.blueGrey,
        leading: Hero(
          tag: 'logo',
          child: Container(
            child: Image.asset("images/logo.png"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: getChannels(streamchat),
              builder: (_, AsyncSnapshot<List<Channel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // clear list to avoid duplicates
                channels.clear();
                // repopulate list
                channels.addAll(snapshot.data);

                if (snapshot.data.length == 0) {
                  return Container();
                }

                return ListView(
                  scrollDirection: Axis.vertical,
                  children: createListOfChannels(snapshot.data, context),
                );
              },
            ),
          ),
          CustomForm(
            controller: _controller,
            formKey: _formKey,
            hintText: "Enter a channel name...",
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                final channelName = _controller.value.text;
                final channelTitles = channels.map((e) => e.cid).toList();

                _controller.clear();

                final channel = client.channel(
                  "mobile",
                  id: channelName,
                  extraData: {
                    "image": "https://picsum.photos/100/100",
                  },
                );

                // match against strings where pattern = mobile:*
                if (!channelTitles.contains("mobile:$channelName")) {
                  await channel.create();
                }

                await channel.watch();

                provider.currentChannel = channel;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => StreamChannel(
                      child: ChatPage(),
                      channel: channel,
                    ),
                  ),
                );
              }
            },
            text: "Open Channel",
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final streamChannel = StreamChannel.of(context);
    final channel = streamChannel.channel;

    return Scaffold(
      appBar: ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              messageBuilder: (context, msg, idx) {
                final msgReactionCount = msg.reactionCounts ?? {"like": 0};
                return ListTile(
                  leading: Text("${msg.user.name}"),
                  title: Text("${msg.text}"),
                  subtitle: Text("${msg.createdAt.toIso8601String()}"),
                  trailing: Text("Likes: ${msgReactionCount["like"] ?? 0}"),
                  onTap: () async {
                    await channel.sendReaction(msg.id, "like");
                  },
                );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
