class Bill {
  String? name;
  String? amount;
  String? balance;
  String? logo;
  String? priority;
  String? status;
  String? paymentDate;

  Bill(
      {this.name,
        this.amount,
        this.balance,
        this.logo,
        this.priority,
        this.status,
        this.paymentDate});

//receive data from server
  factory Bill.fromSnapshot(snapshot) {
    return Bill(
      name: snapshot['name'] as String,
      amount: snapshot['amount'] as String,
      balance: snapshot['balance'] as String,
      logo: snapshot['logo'] as String,
      // priority: snapshot['priority'] as String,
      // status: snapshot['status'] as String,  //Learning about receiving snapshots from the DB
      paymentDate: snapshot['paymentDate'] as String,
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