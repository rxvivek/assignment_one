import 'package:assignment_one/core/error/failures.dart';
import 'package:assignment_one/core/funcation/map_failure_to_message.dart';
import 'package:assignment_one/domain/entity/characters_entity.dart';
import 'package:assignment_one/domain/entity/episodes_entity.dart';
import 'package:assignment_one/domain/usecase/get_characters_usecase.dart';
import 'package:assignment_one/domain/usecase/get_episodes_by_series_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final GetEpisodesBySeriesUSeCase getEpisodesBySeriesUSeCase;
  final GetCharacterUseCase getCharacterUseCase;
  EpisodesCubit({required this.getEpisodesBySeriesUSeCase,required this.getCharacterUseCase})
      : super(EpisodesInitial());

  getEpisodes(String name) async {
    emit(EpisodesLoading());
    final Future<Either<Failure, List<EpisodesEntity>>?>? charactersEntity =
    getEpisodesBySeriesUSeCase.call(name);
    charactersEntity!.then((value) {
      value!.fold((l) => emit(EpisodesFailed(mapFailureToMessage(l))),
              (r) =>emit(EpisodesLoaded(r)));
    });
  }
  getCharacterList(List<String> list) async {
    emit(EpisodesLoading());
    final Future<Either<Failure, List<CharactersEntity>>?>? charactersEntity =
    getCharacterUseCase.call(list);
    charactersEntity!.then((value) {
      value!.fold((l) => emit(EpisodesFailed(mapFailureToMessage(l))),
              (r) =>emit(EpisodesLoaded(r)));
    });
  }
}
