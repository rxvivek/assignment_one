
import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/core/usecases/usecase.dart';
import 'package:assignment_one/domain/entity/characters_entity.dart';
import 'package:assignment_one/domain/repository/breaking_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharacterUseCase extends UseCase<List<CharactersEntity>,List<String>>{
  final BreakingRepository breakingRepository;

  GetCharacterUseCase({required this.breakingRepository});

  @override
  Future<Either<Failure, List<CharactersEntity>>?>? call(List<String> params) {
    return breakingRepository.getCharacters(params);
  }


}