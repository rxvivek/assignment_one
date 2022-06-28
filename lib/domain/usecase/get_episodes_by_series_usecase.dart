import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/core/usecases/usecase.dart';
import 'package:assignment_one/domain/entity/episodes_entity.dart';
import 'package:assignment_one/domain/repository/breaking_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodesBySeriesUSeCase extends UseCase<List<EpisodesEntity>,String>{
  final BreakingRepository breakingRepository;

  GetEpisodesBySeriesUSeCase({required this.breakingRepository});

  @override
  Future<Either<Failure,List<EpisodesEntity>>?>? call(String params){
    return breakingRepository.getEpisodesBySeries(params);
  }
}