class Bill {
  final int billAmount;
  final int billbalance;
  final String logo;
  final String billName;
  final String billPriority;
  final String billStatus;
  final String paymentDate;

  Bill(
      {required this.billAmount,
      required this.billbalance,
      required this.logo,
      required this.billName,
      required this.billPriority,
      required this.billStatus,
      required this.paymentDate});

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
        billAmount: json['billAmount'] as int,
        billbalance: json['billbalance'] as int,
        logo: json['logo'] as String,
        billName: json['billName'] as String,
        billPriority: json['billPriority'] as String,
        billStatus: json['billStatus'] as String,
        paymentDate: json['paymentDate'] as String);
  }

  @override
  String toString() {
    return 'Bill{billAmount: $billAmount, '
        'billbalance: $billbalance, '
        'logo: $logo, '
        'billName: $billName,'
        ' billPriority: $billPriority,'
        ' billStatus: $billStatus,'
        ' paymentDate: $paymentDate}';
  }
}
