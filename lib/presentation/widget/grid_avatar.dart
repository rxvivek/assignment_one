import 'package:assignment_one/domain/entity/characters_entity.dart';
import 'package:flutter/material.dart';

import '../screens/characters_details_screen.dart';


class GridAvatar extends StatelessWidget {
  final CharactersEntity charactersEntity;

  const GridAvatar({required this.charactersEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: false,
                builder: (context) =>  CharacterDetailsScreen(character: charactersEntity,))),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${charactersEntity.name}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: charactersEntity.charId!,
            child: Container(
              color: Colors.grey,
              child: charactersEntity.img!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: charactersEntity.img!,
                fit: BoxFit.cover,
              )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
        ),
      ),
    );
   /* return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundImage: NetworkImage(charactersEntity.img.toString()),
            radius: 50,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(charactersEntity.name.toString()),
      ],
    );*/

  }
}
