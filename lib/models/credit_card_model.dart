class TarjetaCredito {
  final String cardNumberHidden;
  final String cardNumber;
  final String brand;
  final String cvv;
  final String expiracyDate;
  final String cardHolderName;

  TarjetaCredito({
    required this.cardNumber,
    required this.cardNumberHidden,
    required this.brand,
    required this.cvv,
    required this.expiracyDate,
    required this.cardHolderName,
  });
}
