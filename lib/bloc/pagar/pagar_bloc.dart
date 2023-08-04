import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stripe_app/models/credit_card_model.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(const PagarState()) {
    on<SelectCard>(
      (event, emit) => emit(
        state.copyWith(tarjeta: event.tarjeta, tarjetaActiva: true),
      ),
    );
    on<DeactivateCard>(
      (event, emit) => emit(
        state.copyWith(tarjetaActiva: false),
      ),
    );
  }
}
