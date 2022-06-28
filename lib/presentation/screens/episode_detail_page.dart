import 'package:assignment_one/domain/entity/episodes_entity.dart';
import 'package:assignment_one/presentation/cubit/episodescubit/episodes_cubit.dart';
import 'package:assignment_one/presentation/widget/grid_avatar.dart';
import 'package:assignment_one/presentation/widget/loading_widget.dart';
import 'package:assignment_one/presentation/widget/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EpisodeDetailPage extends StatelessWidget {
  final EpisodesEntity episodesEntity;

  const EpisodeDetailPage(this.episodesEntity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episodesEntity.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          "Episode : ${episodesEntity.episode}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AirDate : ${episodesEntity.airDate}",
                          style: const TextStyle(
                            package: 'awesome_card',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MavenPro',
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(

                              "series : ${episodesEntity.series}",
                              style: const TextStyle(
                                  package: 'awesome_card',
                                  color: Colors.black,
                                  fontFamily: 'MavenPro',
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "season : ${episodesEntity.season}",
                              style: const TextStyle(
                                  package: 'awesome_card',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'MavenPro',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "EpisodeId : ${episodesEntity.episodeId}",
                          style: const TextStyle(
                            package: 'awesome_card',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Characters",
                          style: TextStyle(
                            package: 'awesome_card',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<EpisodesCubit, EpisodesState>(
                          builder: (context, state) {
                            if (state is EpisodesLoading) {
                              return const LoadingWidget();
                            } else if (state is EpisodesLoaded) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2 / 3,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                    ),
                                    itemCount: state.episodesList.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return GridAvatar(
                                          charactersEntity: state.episodesList[index]);
                                    }),
                              );
                            } else if (state is EpisodesFailed) {
                              return MessageDisplay(
                                message: state.message,
                              );
                            }
                            return const MessageDisplay(
                              message: 'Hello',
                            );
                          },
                        ),

                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
