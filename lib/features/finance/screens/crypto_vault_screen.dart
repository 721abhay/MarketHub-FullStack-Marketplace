import 'package:flutter/material.dart';

class CryptoVaultScreen extends StatelessWidget {
  static const String routeName = '/crypto-vault';
  const CryptoVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text('Crypto Vault'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildWalletBalance(),
            const SizedBox(height: 48),
            _buildAssetRow('Bitcoin', 'BTC', '0.045', '\$2,100', 'https://cryptologos.cc/logos/bitcoin-btc-logo.png'),
            _buildAssetRow('Ethereum', 'ETH', '1.20', '\$3,400', 'https://cryptologos.cc/logos/ethereum-eth-logo.png'),
            _buildAssetRow('Solana', 'SOL', '15.5', '\$1,100', 'https://cryptologos.cc/logos/solana-sol-logo.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletBalance() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.indigo[800]!, Colors.purple[800]!], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(32)),
      child: const Column(
        children: [
          Text('Total Portfolio Value', style: TextStyle(color: Colors.white70)),
          Text('\$6,600.00', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_ActionIcon(Icons.arrow_upward, 'Send'), _ActionIcon(Icons.arrow_downward, 'Receive'), _ActionIcon(Icons.swap_horiz, 'Swap')]),
        ],
      ),
    );
  }

  Widget _buildAssetRow(String name, String symbol, String qty, String val, String logourl) {
    return Container(
       margin: const EdgeInsets.only(bottom: 12),
       padding: const EdgeInsets.all(20),
       decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(24)),
       child: Row(
         children: [
           CircleAvatar(backgroundColor: Colors.white12, radius: 20, child: Text(symbol[0], style: const TextStyle(color: Colors.white))),
           const SizedBox(width: 16),
           Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('$qty $symbol', style: const TextStyle(color: Colors.grey, fontSize: 12))])),
           Text(val, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
         ],
       ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionIcon(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(children: [CircleAvatar(backgroundColor: Colors.white.withValues(alpha: 0.1), child: Icon(icon, color: Colors.white, size: 20)), const SizedBox(height: 8), Text(label, style: const TextStyle(color: Colors.white, fontSize: 11))]);
  }
}
