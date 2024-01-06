import '../Block/block.dart';

class Chain {
  late List<Block> chain;

  Chain() {
    chain = [createGenesisBlock()];
  }

  Block createGenesisBlock() {
    return Block(0, DateTime.now(), "Genesis Block", "0");
  }

  Block getLatestBlock() {
    return chain.last;
  }

  Block addBlock(String data) {
    Block previousBlock = getLatestBlock();
    int newIndex = previousBlock.index + 1;
    DateTime newTimestamp = DateTime.now();
    Block newBlock = Block(newIndex, newTimestamp, data, previousBlock.hash);
    chain.add(newBlock);
    return newBlock;
  }

  bool isChainValid() {
    for (int i = 1; i < chain.length; i++) {
      Block currentBlock = chain[i];
      Block previousBlock = chain[i - 1];

      if (currentBlock.hash != currentBlock.calculateHash() ||
          currentBlock.previousHash != previousBlock.hash) {
        return false;
      }
    }
    return true;
  }
}
