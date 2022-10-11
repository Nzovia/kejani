class Bill {
  int? amount;
  int? balance;
  String? logo;
  String? name;
  String? priority;
  String? status;
  String? paymentDate;

  Bill({ this.amount,
    this.balance,
    this.logo,
    this.name,
    this.priority,
    this.status,
    this.paymentDate});

//receive data from server
  factory Bill.fromMap(map) {
    return Bill(
      amount: map['amount'],
      name: map['name'],
      balance: map['balance'],
      logo: map['logo'],
      priority: map['priority'],
      status: map['status'],
      paymentDate: map['paymentDate'],
    );
  }

//sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'name': name,
      'balance': balance,
      'logo': logo,
      'priority': priority,
      'status': status,
      'paymentDate': paymentDate,
    };
  }
}
