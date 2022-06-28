import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/data/datasource/breaking_data_source.dart';
import 'package:assignment_one/domain/entity/characters_entity.dart';
import 'package:assignment_one/domain/entity/episodes_entity.dart';
import 'package:assignment_one/domain/repository/breaking_repository.dart';
import 'package:dartz/dartz.dart';

class BreakingRepositoryImpl implements BreakingRepository {
  final BreakingDataSource breakingDataSource;

  BreakingRepositoryImpl({required this.breakingDataSource});

  @override
  Future<Either<Failure, List<String>>> getAllSeries() async {
    return await breakingDataSource.getAllSeries();
  }



  @override
  Future<Either<Failure, List<EpisodesEntity>>> getEpisodesBySeries(
      String series)  {
    return  breakingDataSource.getEpisodesBySeries(series);
  }

  @override
  Future<Either<Failure, List<CharactersEntity>>> getCharacters(List<String> characterList) async {
    return  await breakingDataSource.getCharacters(characterList);
  }
}
