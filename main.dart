import 'dart:io';

import 'Block/block.dart';
import 'Blockchain/chain.dart';

Future<void> main() async {
  Chain myBlockchain = Chain();

  int i = 0;
  print("------------------------------------------------------");
  print("Welcome to the MG Blockchain!");
  print("------------------------------------------------------");
  bool flag = true;

  while (flag) {
    print("Enter 0 to add a block");
    print("Enter 1 to print the entire blockchain");
    print("Enter 2 to exit");

    stdout.write("Enter your choice: ");
    i = int.parse(stdin.readLineSync()!);

    switch (i) {
      case 0:
        print("------------------------------------");
        stdout.write("Enter data to store in block: ");
        String? name = stdin.readLineSync();
        Block b = myBlockchain.addBlock(name!);
        print("Block ${b.index + 1} mined with nonce ${b.nonce}: ${b.hash}");
        print("Block count: ${myBlockchain.chain.length}");
        print("------------------------------------");
        break;
      case 1:
        print("Printing Entire Blockchain: ");
        print("====================================");
        for (var i = 0; i < myBlockchain.chain.length; i++) {
          print(
              "Block ${i + 1}: ${myBlockchain.chain[i].hash}, ${myBlockchain.chain[i].data}");
        }

        print("Is blockchain valid: ${myBlockchain.isChainValid()}");
        print("====================================");
        break;
      case 2:
        print("------------------------------------");
        print("Blockchain stopped gracefully..");
        print("------------------------------------");

        flag = false;
        break;
      default:
        print("Invalid choice. Please enter 0, 1, or 2.");
        break;
    }
  }
}
