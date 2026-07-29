import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

 /* 
 * * Events
 */
abstract class AurixEvent extends Equatable {
  const AurixEvent();

  @override
  List<Object?> get props => [];
}

class StartListening extends AurixEvent {}

class StopListening extends AurixEvent {}

/* 
  * * States
*/
abstract class AurixState extends Equatable {
  const AurixState();

  @override
  List<Object?> get props => [];
}

class AurixIdle extends AurixState {}

class AurixListening extends AurixState {}

/* 
  * * Bloc
*/
class AurixBloc extends Bloc<AurixEvent, AurixState> {
  AurixBloc() : super(AurixIdle()) {
    on<StartListening>((event, emit) => emit(AurixListening()));
    on<StopListening>((event, emit) => emit(AurixIdle()));
  }
}
