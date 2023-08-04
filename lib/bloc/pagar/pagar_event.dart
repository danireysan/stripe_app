part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class SelectCard extends PagarEvent {
  final TarjetaCredito tarjeta;

  SelectCard(this.tarjeta);
}

class DeactivateCard extends PagarEvent {}
