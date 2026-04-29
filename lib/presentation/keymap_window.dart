import 'package:flutter/material.dart';

class KeymapWindow extends StatelessWidget {
  const KeymapWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // Choose contrasting colors based on theme. Blue is very readable in both dark/light modes.
    final textColor = isDark ? Colors.lightBlueAccent : Colors.blue[800]!;
    final bgColor = isDark ? Colors.blue.withAlpha(25) : Colors.blue.withAlpha(25);
    final borderColor = isDark ? Colors.blue.withAlpha(50) : Colors.blue.withAlpha(50);

    return Material(
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection('Vowels', _vowels, theme, textColor, bgColor, borderColor),
                  const SizedBox(height: 16),
                  _buildSection('Consonants', _consonants, theme, textColor, bgColor, borderColor),
                  const SizedBox(height: 16),
                  _buildSection('Special Characters', _special, theme, textColor, bgColor, borderColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Map<String, String> map, ThemeData theme, Color textColor, Color bgColor, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: map.entries.map((e) => _buildKeymapItem(e.key, e.value, theme, textColor, bgColor, borderColor)).toList(),
        ),
      ],
    );
  }

  Widget _buildKeymapItem(String sinhala, String singlish, ThemeData theme, Color textColor, Color bgColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(sinhala, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text(singlish, style: TextStyle(fontFamily: 'monospace', color: textColor, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

const Map<String, String> _vowels = {
  'අ': 'a',
  'ආ': 'aa, a\\)',
  'ඇ': 'A, \\a',
  'ඈ': 'Aa, A\\), ae',
  'ඉ': 'i',
  'ඊ': 'ii, i\\), ie, ee',
  'උ': 'u',
  'ඌ': 'oo, uu, u\\)',
  'එ': 'e',
  'ඒ': 'ea, e\\), ei',
  'ඔ': 'o',
  'ඕ': 'o\\), oe',
  'ඖ': 'au',
  'ඓ': 'I',
};

const Map<String, String> _consonants = {
  'ක': 'k', 'ඛ': 'kh, K', 'ග': 'g', 'ඝ': 'gh, G', 'ඟ': 'nng',
  'ච': 'c', 'ඡ': 'ch', 'ජ': 'j', 'ඣ': 'jh', 'ඤ': 'KN', 'ඥ': 'GN',
  'ට': 'T', 'ඨ': 'Th', 'ඩ': 'D', 'ඪ': 'Dh', 'ණ': 'N',
  'ත': 't', 'ථ': 'th', 'ද': 'd', 'ධ': 'dh', 'න': 'n',
  'ප': 'p', 'ඵ': 'ph, P', 'බ': 'b', 'භ': 'bh', 'ම': 'm', 'ඹ': 'B',
  'ය': 'y', '‍ය': '\\y, Y', 'ර': 'r', 'ල': 'l', 'ව': 'v, w',
  'ශ': 'S', 'ෂ': 'sh', 'ස': 's', 'හ': 'h', 'ළ': 'L', 'ෆ': 'f',
  'ඬ': 'nnd', 'ඳ': 'nndh', 'ළු': 'Lu',
};

const Map<String, String> _special = {
  'ං': '\\n', 'ඃ': '\\h', 'ඞ': '\\N', 'ඍ': '\\R',
  'ර්‍': 'R, \\r', 'ෲ': 'ruu', 'ෘ': 'ru'
};
