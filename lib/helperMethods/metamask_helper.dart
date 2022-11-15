import 'package:dotpay/helperMethods/wallet_connect.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/credentials.dart';
import 'package:http/http.dart' as http;

class MetamaskHelper {
  wallconn() async {
    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Metabox',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
    connector.on('connect', (session) => print(session));
    connector.on('session_update', (payload) => print(payload));
    connector.on('disconnect', (session) => print(session));

// Create a new session
    if (!connector.connected) {
      final session = await connector.createSession(
        chainId: 80001,
        onDisplayUri: (uri) async {
          print(await launchUrlString(uri));
        },
      );

      final sender = EthereumAddress.fromHex(session.accounts[0]);
      print("address: $sender");
      final provider = EthereumWalletConnectProvider(connector);
      final credentials = WalletConnectEthereumCredentials(provider: provider);
      try {
        await http.post(
          Uri.parse(''),
        );
      } catch (e) {}
    }
  }
}
