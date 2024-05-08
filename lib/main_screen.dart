import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:radio/radio_provider.dart' as r;
import 'package:radio/radio_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // setUrl();
  }

  Future setUrl() async {
    await player.setUrl(
        'https://server03.quran.com.kw:7000/stream?type=http&nocache=1948');
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<RadioProvider>(
            builder: (context, rP, child) {
              return ListView.builder(
                  itemCount: rP.radios.length,
                  itemBuilder: (context, index) {
                    return Tile(
                      radio: rP.radios[index],
                      player: player,
                    );
                  });
            },
          ),
        )

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       StreamBuilder<PlayerState>(
        //         stream: player.playerStateStream,
        //         builder: (context, snapshot) {
        //           final playerState = snapshot.data;
        //           final processingState = playerState?.processingState;
        //           final playing = playerState?.playing;
        //           if (processingState == ProcessingState.loading ||
        //               processingState == ProcessingState.buffering) {
        //             return Container(
        //               margin: const EdgeInsets.all(8.0),
        //               width: 64.0,
        //               height: 64.0,
        //               child: const CircularProgressIndicator(),
        //             );
        //           } else if (playing != true) {
        //             return IconButton(
        //               icon: const Icon(Icons.play_arrow),
        //               iconSize: 64.0,
        //               onPressed: player.play,
        //             );
        //           } else if (processingState != ProcessingState.completed) {
        //             return IconButton(
        //               icon: const Icon(Icons.pause),
        //               iconSize: 64.0,
        //               onPressed: player.pause,
        //             );
        //           } else {
        //             return IconButton(
        //               icon: const Icon(Icons.replay),
        //               iconSize: 64.0,
        //               onPressed: () => player.play(),
        //             );
        //           }
        //         },
        //       ),
        //     ],
        //   ),
        //   // IconButton(
        //   //     onPressed: () async {

        //   //      await player.setUrl('');
        //   //      await player.play();
        //   //     },
        //   //     icon: Icon(Icons.play_arrow)),
        // ),

        );
  }
}

class Tile extends StatefulWidget {
  const Tile({super.key, this.radio, required this.player});
  final r.Radio? radio;
  final AudioPlayer player;
  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(3),
        height: 100,
        width: 100,
        child: Image.network(
          widget.radio!.radioImage!,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(widget.radio!.name!),
      trailing: IconButton(
          onPressed: () async {
            await widget.player.setUrl(widget.radio!.radioUrl!);
            if (widget.player.playing) {
              await widget.player.stop();
              setState(() {
                isPlaying = false;
              });
            } else {
              await widget.player.play();
              setState(() {
                isPlaying = true;
              });
            }
          },
          icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
    );
  }
}
