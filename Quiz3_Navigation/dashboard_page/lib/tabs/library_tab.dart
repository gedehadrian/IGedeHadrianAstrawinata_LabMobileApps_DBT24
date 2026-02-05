import 'package:flutter/material.dart';

void main() => runApp(const LibrariesApp());

class LibrariesApp extends StatelessWidget {
  const LibrariesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0B57D0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LibraryTab(),
    );
  }
}

class LibraryTab extends StatelessWidget {
  const LibraryTab({super.key});

  static const Color _primary = Color(0xFF0B57D0);
  static const Color _textMuted = Color(0xFF6B7280);
  static const Color _divider = Color(0xFFE5E7EB);

  static const double _s8 = 8;
  static const double _s12 = 12;
  static const double _s16 = 16;
  static const double _s24 = 24;

  static const TextStyle _topLinkStyle = TextStyle(
    fontSize: 12.5,
    height: 1.25,
    fontWeight: FontWeight.w500,
    color: _primary,
  );

  static const TextStyle _breadcrumbLink = TextStyle(
    fontSize: 13,
    height: 1.25,
    fontWeight: FontWeight.w600,
    color: _primary,
  );

  static const TextStyle _breadcrumbMuted = TextStyle(
    fontSize: 13,
    height: 1.25,
    fontWeight: FontWeight.w500,
    color: _textMuted,
  );

  static const TextStyle _h1 = TextStyle(
    fontSize: 34,
    height: 1.1,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    letterSpacing: -0.4,
  );

  static const TextStyle _itemTitle = TextStyle(
    fontSize: 22,
    height: 1.15,
    fontWeight: FontWeight.w800,
    color: _primary,
  );

  static const TextStyle _body = TextStyle(
    fontSize: 15.5,
    height: 1.55,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle _meta = TextStyle(
    fontSize: 15.5,
    height: 1.55,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle _link = TextStyle(
    fontSize: 15.5,
    height: 1.55,
    fontWeight: FontWeight.w700,
    color: _primary,
    decoration: TextDecoration.underline,
    decorationThickness: 1.2,
  );

  List<LibraryItem> _data() => const [
    LibraryItem(
      title: "BSD Campus",
      addressLines: [
        "BSD City Kavling Edutown I.1",
        "Jl. BSD Raya Utama",
        "BSD City",
        "Tangerang, Banten 15339",
        "Indonesia",
      ],
      phone: "(021) 30450500",
      website: "https://www.prasetiyamulya.ac.id/",
    ),
    LibraryItem(
      title: "Cilandak Campus",
      addressLines: [
        "Jl. RA. Kartini (TB Simatupang)",
        "Cilandak Barat",
        "Jakarta Selatan, DKI Jakarta 12430",
        "Indonesia",
      ],
      phone: "(021) 751 1126",
      website: "https://www.prasetiyamulya.ac.id/",
    ),
    LibraryItem(
      title: "Digital Text Book",
      addressLines: [],
      phone: null,
      website: "https://www.prasetiyamulya.ac.id/",
    ),
    LibraryItem(
      title: "Prasetiya Mulya Library",
      addressLines: [],
      phone: null,
      website: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final pad = w < 420 ? _s16 : _s24;

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: EdgeInsets.fromLTRB(pad, _s16, pad, _s24),
              children: [
                const TopLinksBar(primary: _primary, style: _topLinkStyle),
                const SizedBox(height: _s16),
                const Breadcrumb(
                  primary: _primary,
                  linkStyle: _breadcrumbLink,
                  mutedStyle: _breadcrumbMuted,
                ),
                const SizedBox(height: _s16),
                const Text("Libraries", style: _h1),
                const SizedBox(height: _s16),
                Container(height: 1, color: _divider),
                const SizedBox(height: _s16),
                LibrariesList(
                  items: _data(),
                  dividerColor: _divider,
                  titleStyle: _itemTitle,
                  bodyStyle: _body,
                  metaStyle: _meta,
                  linkStyle: _link,
                  spacing12: _s12,
                  spacing16: _s16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopLinksBar extends StatelessWidget {
  final Color primary;
  final TextStyle style;

  const TopLinksBar({super.key, required this.primary, required this.style});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 0,
      runSpacing: 6,
      children: [
        LinkText(text: "Advanced search", url: "advanced-search", style: style),
        const _Pipe(),
        LinkText(
          text: "Authority search",
          url: "authority-search",
          style: style,
        ),
        const _Pipe(),
        LinkText(text: "Tag cloud", url: "tag-cloud", style: style),
        const _Pipe(),
        LinkText(text: "Libraries", url: "libraries", style: style),
      ],
    );
  }
}

class Breadcrumb extends StatelessWidget {
  final Color primary;
  final TextStyle linkStyle;
  final TextStyle mutedStyle;

  const Breadcrumb({
    super.key,
    required this.primary,
    required this.linkStyle,
    required this.mutedStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 6,
      children: [
        LinkText(text: "Home", url: "home", style: linkStyle),
        const SizedBox(width: 8),
        Text(">", style: mutedStyle),
        const SizedBox(width: 8),
        Text("Libraries", style: mutedStyle),
      ],
    );
  }
}

class LibrariesList extends StatelessWidget {
  final List<LibraryItem> items;
  final Color dividerColor;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final TextStyle metaStyle;
  final TextStyle linkStyle;
  final double spacing12;
  final double spacing16;

  const LibrariesList({
    super.key,
    required this.items,
    required this.dividerColor,
    required this.titleStyle,
    required this.bodyStyle,
    required this.metaStyle,
    required this.linkStyle,
    required this.spacing12,
    required this.spacing16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          LibraryCard(
            item: items[i],
            titleStyle: titleStyle,
            bodyStyle: bodyStyle,
            metaStyle: metaStyle,
            linkStyle: linkStyle,
            spacing12: spacing12,
          ),
          if (i != items.length - 1) ...[
            SizedBox(height: spacing16),
            Divider(height: 1, thickness: 1, color: dividerColor),
            SizedBox(height: spacing16),
          ],
        ],
      ],
    );
  }
}

class LibraryCard extends StatelessWidget {
  final LibraryItem item;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final TextStyle metaStyle;
  final TextStyle linkStyle;
  final double spacing12;

  const LibraryCard({
    super.key,
    required this.item,
    required this.titleStyle,
    required this.bodyStyle,
    required this.metaStyle,
    required this.linkStyle,
    required this.spacing12,
  });

  @override
  Widget build(BuildContext context) {
    final hasAddress = item.addressLines.isNotEmpty;
    final hasPhone = (item.phone ?? "").trim().isNotEmpty;
    final hasWebsite = (item.website ?? "").trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: titleStyle),
        if (hasAddress) ...[
          const SizedBox(height: 10),
          Text(item.addressLines.join("\n"), style: bodyStyle),
        ],
        if (hasPhone) ...[
          SizedBox(height: hasAddress ? spacing12 : 10),
          Text("Phone: ${item.phone}", style: metaStyle),
        ],
        if (hasWebsite) ...[
          SizedBox(height: (hasAddress || hasPhone) ? spacing12 : 10),
          LinkText(
            text: item.website!,
            url: item.website!,
            style: linkStyle,
            underline: true,
          ),
        ],
      ],
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle style;
  final bool underline;

  const LinkText({
    super.key,
    required this.text,
    required this.url,
    required this.style,
    this.underline = false,
  });

  void _snack(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Open link: $url"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effective = underline
        ? style
        : style.copyWith(decoration: TextDecoration.none);

    return InkWell(
      onTap: () => _snack(context),
      child: Text(text, style: effective),
    );
  }
}

class _Pipe extends StatelessWidget {
  const _Pipe();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        "|",
        style: TextStyle(
          color: Color(0xFF9CA3AF),
          fontSize: 12.5,
          height: 1.25,
        ),
      ),
    );
  }
}

class LibraryItem {
  final String title;
  final List<String> addressLines;
  final String? phone;
  final String? website;

  const LibraryItem({
    required this.title,
    required this.addressLines,
    required this.phone,
    required this.website,
  });
}
