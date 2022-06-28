import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/core/usecases/usecase.dart';
import 'package:assignment_one/domain/repository/breaking_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllSeriesUseCase extends UseCase<List<String>, NoParams> {
final BreakingRepository breakingRepository;

GetAllSeriesUseCase({required this.breakingRepository});

  @override
  Future<Either<Failure, List<String>>?>? call(NoParams params) {
    return breakingRepository.getAllSeries();
  }


}