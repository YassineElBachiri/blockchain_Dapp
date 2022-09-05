import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';

class NameFactory extends ChangeNotifier {
  final String _netWorkUrl =
      "https://rinkeby.infura.io/v3/b777c576c3574a5597b21f8eef184c3d";
  final String _netWorkSoketUrl =
      "wss://rinkeby.infura.io/ws/v3/b777c576c3574a5597b21f8eef184c3d";
  final String walletPrivateKey =
      "aa8760e5297a00d1882293697566648dab9c48aed5bcfecbaa915c8e9706bf6e";

  String rinkebyContractAddress = "0x04669DC23A075F7739cca6C6306Ed9bb0ec2E677";

  late Web3Client _client;
  late Credentials _credentials;
  late EthereumAddress walletAddress;
  late EthereumAddress _contractAddress;

  String mainAddress = "";

  NameFactory() {
    setUp();
  }

  String _abiCode = "";

  Future<void> setUp() async {
    _client = Web3Client(_netWorkUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_netWorkSoketUrl).cast<String>();
    });
    await getWalletAddress();
    await getAbi();
  }

  Future<void> getWalletAddress() async {
    _credentials = await _client.CredentialsFromPrivateKey(walletPrivateKey);

    walletAddress = await _credentials.extractAddress();

    mainAddress = walletAddress.toString();
    print("My Address is:" + walletAddress.toString());

    notifyListeners();
  }

  Future<void> getAbi() async {
    String abiFile = await rootBundle.loadString("src/abis/abiName.json");
    var jsonAbi = jsonDecode(abiFile);
    _abiCode = jsonEncode(jsonAbi);
    print(abiFile);
    _contractAddress = EthereumAddress.fromHex(rinkebyContractAddress);
  }
}
