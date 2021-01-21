import 'package:flutter/foundation.dart';
import 'package:flutter_ravepay/src/meta.dart';

class RavepayConfig {
  final double amount;
  final String country;
  final String currency;
  final String email;
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String narration;
  final String publicKey;
  final String secretKey;
  final String encryptionKey;
  final String txRef;
  final bool useAccounts;
  final bool useCards;
  final bool isStaging;
  final bool useSave;
  final bool style;
  final List<RavepayMeta> metadata;
  final String paymentPlan;

  const RavepayConfig({
    @required this.amount,
    @required this.country,
    @required this.currency,
    @required this.email,
    @required this.firstname,
    this.lastname = "",
    this.phonenumber = "",
    this.narration = "",
    @required this.publicKey,
    this.secretKey ="",
    @required this.encryptionKey,
    @required this.txRef,
    this.metadata,
    this.useAccounts = true,
    this.useCards = true,
    this.isStaging = true,
    this.useSave = true,
    this.style,
    this.paymentPlan
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "amount": amount.toString(),
      "currency": currency,
      "country": country,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "phonenumber": phonenumber,
      "narration": narration,
      "publicKey": publicKey,
      "secretKey": secretKey,
      "encryptionKey": encryptionKey,
      "txRef": txRef,
      "useAccounts": useAccounts,
      "metadata": metadata != null
          ? metadata.map((meta) => meta.toMap()).toList()
          : <String>[],
      "useCards": useCards,
      "isStaging": isStaging,
      "useSave": useSave,
      "style": null,
      "paymentPlan": paymentPlan,
    };
  }
}
