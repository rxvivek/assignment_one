import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/data/model/characters_model.dart';
import 'package:assignment_one/data/model/episodes_model.dart';
import 'package:dartz/dartz.dart';

abstract class BreakingDataSource{
  Future<Either<Failure,List<String>>> getAllSeries();
  Future<Either<Failure,List<EpisodesModel>>> getEpisodesBySeries(String series);
  Future<Either<Failure,List<CharactersModel>>> getCharacters(List<String> characterList);
}