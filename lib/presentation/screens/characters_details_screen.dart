import 'package:assignment_one/domain/entity/characters_entity.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharactersEntity character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname!,
          style: const TextStyle(color: Colors.white),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.yellow,
      thickness: 2,
    );
  }


  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.occupation!.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', character.status!),
                      buildDivider(300),
                      character.betterCallSaulAppearance!.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                          character.betterCallSaulAppearance!.join(" / ")),
                      character.betterCallSaulAppearance!.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.name!),
                      buildDivider(235),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}