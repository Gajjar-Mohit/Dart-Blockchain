import 'dart:convert';

import 'package:crypto/crypto.dart';

class Block {
  int index;
  DateTime timestamp;
  String data;
  String previousHash;
  late String hash;
  late int nonce; // Nonce added for proof-of-work

  Block(this.index, this.timestamp, this.data, this.previousHash) {
    this.nonce = 0; // Initialize nonce to 0
    this.hash = mineBlock(); // Mine the block to find a valid hash
  }

  String calculateHash() {
    String data = '$index$timestamp${this.data}$previousHash$nonce';
    List<int> bytes = utf8.encode(data);
    Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  String mineBlock() {
    while (true) {
      hash = calculateHash(); // Calculate hash with current nonce
      if (hash.startsWith("0000")) {
        // Adjust the number of leading zeros for difficulty
        break; // Found a valid hash, exit the loop
      } else {
        nonce++; // Increment nonce and try again
      }
    }
    return hash;
  }
}
