class UserCard {
  final String cardholder;
  final String cardnumber;
  final String expiredate;
  final String cvv;

  UserCard({
    required this.cardholder,
    required this.cardnumber,
    required this.expiredate,
    required this.cvv,
  });

  UserCard copyWith({
    String? cardholder,
    String? cardnumber,
    String? expiredate,
    String? cvv,
  }) {
    return UserCard(
      cardholder: cardholder ?? this.cardholder,
      cardnumber: cardnumber ?? this.cardnumber,
      expiredate: expiredate ?? this.expiredate,
      cvv: cvv ?? this.cvv,
    );
  }
}
