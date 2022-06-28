import 'package:assignment_one/domain/entity/episodes_entity.dart';
import 'package:assignment_one/presentation/cubit/episodescubit/episodes_cubit.dart';
import 'package:assignment_one/presentation/screens/episode_detail_page.dart';
import 'package:assignment_one/presentation/widget/loading_widget.dart';
import 'package:assignment_one/presentation/widget/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_one/injection_container.dart' as di;

class EpisodePage extends StatefulWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  EpisodePageState createState() => EpisodePageState();
}

class EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Episodes"),
      ),
      body: BlocBuilder<EpisodesCubit, EpisodesState>(
        builder: (context, state) {
          if (state is EpisodesLoading) {
            return const LoadingWidget();
          } else if (state is EpisodesLoaded) {
            return Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(8.0),
              child: _buildListWidget(context, state.episodesList as dynamic),
            );
          } else if (state is EpisodesFailed) {
            return MessageDisplay(
              message: state.message,
            );
          }
          return const MessageDisplay(
            message: 'Hi.....',
          );
        },
      ),
    );
  }

  _buildListWidget(BuildContext context, List<EpisodesEntity> episodesList) {
    return ListView.builder(
        itemCount: episodesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
                onTap: () =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: false,
                            builder: (context) =>
                                BlocProvider.value(
                                  value:  di.sl<EpisodesCubit>()..getCharacterList(episodesList[index].characters!),
                                  child: EpisodeDetailPage(episodesList[index]),
                                ))),
                leading: const Icon(Icons.movie_outlined),
                trailing: Text(episodesList[index].airDate.toString()),
                title: Text(episodesList[index].title.toString())
            ),
          );
        }
    );
  }
}
