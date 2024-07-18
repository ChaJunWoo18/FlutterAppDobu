class ConsumHistModel {
  late int? id;
  late final String date;
  late final String receiver;
  late final int amount;
  late final int categoryId;

  ConsumHistModel({
    this.id,
    required this.date,
    required this.receiver,
    required this.amount,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'receiver': receiver,
      'amount': amount,
      'categoryId': categoryId,
    };
  }

  factory ConsumHistModel.fromMap(Map<String, dynamic> map) {
    return ConsumHistModel(
      id: map['id'],
      date: map['date'],
      receiver: map['receiver'],
      amount: map['amount'],
      categoryId: map['categoryId'],
    );
  }
}
