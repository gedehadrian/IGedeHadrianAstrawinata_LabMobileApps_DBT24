import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  static const _primary = Color(0xFF0B57D0);
  static const _pageBg = Color(0xFFF6F7F9);
  static const _surface = Colors.white;
  static const _border = Color(0xFFE5E7EB);
  static const _muted = Color(0xFF6B7280);
  static const _muted2 = Color(0xFF9CA3AF);

  static const _studentId = "23502410003";
  static const _studentName = "I Gede Hadrian Astrawinata";
  static const _email = "23502410003@student.prasetiyamulya.ac.id";
  static const _major = "STEM / Digital Business Technology";
  static const _campus = "BSD Campus";
  static const _avatarUrl =
      "https://lms.prasetiyamulya.ac.id/pluginfile.php/428967/user/icon/moove/f1?rev=34020774";

  static const _courses = <String>[
    "Information for S1 Student",
    "STEM Prasetiya Mulya Innovation Student Organization (SISO)",
    "Bagian Pengembangan Karakter Inovatif (BangKISI) Sekolah STEM Terapan",
    "Academic Information For Student STEM",
    "Discrete Mathematics_CSE23/DBT24",
    "Intro to Database Sys_AIR23-DBT24_20242",
    "Lab Intro to Data Sys_AIR23-DBT24_20242",
    "Fundamental of User Experience_DBT24",
    "Linear Algebra_DBT24",
    "Lab_Software Design n Const_DBT24_20242",
  ];

  static const _miscItems = <String>[
    "Blog entries",
    "Forum posts",
    "Forum discussions",
    "Learning plans",
  ];

  static const _reportsItems = <String>["Browser sessions", "Grades overview"];

  static void _snack(BuildContext context, String text) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: _pageBg,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final cols = w < 900 ? 1 : (w < 1200 ? 2 : 3);
            final hPad = w < 520 ? _S.s16 : _S.s24;

            final content = cols == 1
                ? _OneColumn(
                    left: _leftColumn(),
                    middle: _middleColumn(),
                    right: _rightColumn(),
                  )
                : (cols == 2
                      ? _TwoColumn(
                          left: _leftColumn(),
                          middle: _middleColumn(),
                          right: _rightColumn(),
                        )
                      : _ThreeColumn(
                          left: _leftColumn(),
                          middle: _middleColumn(),
                          right: _rightColumn(),
                        ));

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(hPad, _S.s16, hPad, _S.s24),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: content,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _leftColumn() {
    return _DashboardCard(
      child: Padding(
        padding: const EdgeInsets.all(_S.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _Avatar(url: _avatarUrl)),
            const SizedBox(height: _S.s16),
            Text(
              "$_studentId | $_studentName",
              style: const TextStyle(
                fontSize: 22,
                height: 1.15,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: _S.s12),
            const Text(
              "Personal information",
              style: TextStyle(
                fontSize: 13,
                height: 1.25,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: _S.s12),
            const _KeyValue(label: "Email address:", value: _email),
            const SizedBox(height: _S.s12),
            const _KeyValue(label: "Major/Faculty:", value: _major),
            const SizedBox(height: _S.s12),
            const _KeyValue(label: "Campus:", value: _campus),
          ],
        ),
      ),
    );
  }

  Widget _middleColumn() {
    return Column(
      children: [
        _ClickableCard(
          onTap: (context) => _snack(context, "Privacy and policies"),
          child: const Padding(
            padding: EdgeInsets.all(_S.s16),
            child: _CardHeader(
              title: "Privacy and policies",
              subtitle: "Policies and agreements",
            ),
          ),
        ),
        const SizedBox(height: _S.s16),
        _DashboardCard(
          child: Padding(
            padding: const EdgeInsets.all(_S.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _CardHeader(
                  title: "Course details",
                  subtitle: "Course profiles",
                ),
                const SizedBox(height: _S.s12),
                ..._courses.map(
                  (c) => _ListRow(
                    leading: const _Dot(),
                    title: c,
                    onTap: (context) => _snack(context, c),
                  ),
                ),
                const SizedBox(height: _S.s12),
                Align(
                  alignment: Alignment.centerRight,
                  child: _LinkText(
                    text: "View more",
                    onTap: (context) => _snack(context, "View more"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: _S.s16),
        _DashboardCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(_S.s16, _S.s16, _S.s16, _S.s12),
                child: _CardHeader(title: "Miscellaneous"),
              ),
              const Divider(height: 1, thickness: 1, color: _border),
              ..._miscItems.map(
                (t) =>
                    _SimpleRow(text: t, onTap: (context) => _snack(context, t)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rightColumn() {
    return Column(
      children: [
        _DashboardCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(_S.s16, _S.s16, _S.s16, _S.s12),
                child: _CardHeader(title: "Reports"),
              ),
              const Divider(height: 1, thickness: 1, color: _border),
              ..._reportsItems.map(
                (t) =>
                    _SimpleRow(text: t, onTap: (context) => _snack(context, t)),
              ),
            ],
          ),
        ),
        const SizedBox(height: _S.s16),
        const _DashboardCard(
          child: Padding(
            padding: EdgeInsets.all(_S.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardHeader(title: "Login activity"),
                SizedBox(height: _S.s12),
                _KeyValue(
                  label: "First access to site",
                  value: "Tuesday, 30 July 2024, 7:52 AM (1 year 189 days)",
                  dense: true,
                ),
                SizedBox(height: _S.s12),
                _KeyValue(
                  label: "Last access to site",
                  value: "Wednesday, 4 February 2026, 7:59 PM (now)",
                  dense: true,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: _S.s16),
        _DashboardCard(
          child: Padding(
            padding: const EdgeInsets.all(_S.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _CardHeader(
                  title: "Mobile app",
                  subtitle: "QR code for mobile app access",
                ),
                const SizedBox(height: _S.s12),
                const Text(
                  "Scan the QR code with your mobile app and you will be automatically logged in. The QR code will expire in 10 mins.",
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.45,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: _S.s16),
                Builder(
                  builder: (context) => FilledButton.tonal(
                    onPressed: () => _snack(context, "View QR code"),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFE8F0FE),
                      foregroundColor: _primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: _border),
                      ),
                    ),
                    child: const Text(
                      "View QR code",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SizedBox(height: _S.s16),
                const Text(
                  "Last access to site\nFriday, 8 August 2025, 1:44 PM (180 days 6 hours)",
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.35,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OneColumn extends StatelessWidget {
  final Widget left;
  final Widget middle;
  final Widget right;

  const _OneColumn({
    required this.left,
    required this.middle,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        left,
        const SizedBox(height: _S.s16),
        middle,
        const SizedBox(height: _S.s16),
        right,
      ],
    );
  }
}

class _TwoColumn extends StatelessWidget {
  final Widget left;
  final Widget middle;
  final Widget right;

  const _TwoColumn({
    required this.left,
    required this.middle,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: _S.s16),
            Expanded(child: middle),
          ],
        ),
        const SizedBox(height: _S.s16),
        right,
      ],
    );
  }
}

class _ThreeColumn extends StatelessWidget {
  final Widget left;
  final Widget middle;
  final Widget right;

  const _ThreeColumn({
    required this.left,
    required this.middle,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: _S.s16),
        Expanded(child: middle),
        const SizedBox(width: _S.s16),
        Expanded(child: right),
      ],
    );
  }
}

class _S {
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
}

class _DashboardCard extends StatelessWidget {
  final Widget child;
  const _DashboardCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ProfileTab._surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ProfileTab._border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ClickableCard extends StatelessWidget {
  final Widget child;
  final void Function(BuildContext context) onTap;

  const _ClickableCard({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: _HoverInk(
        borderRadius: 14,
        onTap: () => onTap(context),
        child: child,
      ),
    );
  }
}

class _HoverInk extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;

  const _HoverInk({
    required this.child,
    required this.onTap,
    required this.borderRadius,
  });

  @override
  State<_HoverInk> createState() => _HoverInkState();
}

class _HoverInkState extends State<_HoverInk> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final bg = _hover ? const Color(0xFFF8FAFC) : Colors.transparent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: widget.onTap,
          child: widget.child,
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _CardHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final hasSub = (subtitle ?? "").trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.5,
            height: 1.25,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        if (hasSub) ...[
          const SizedBox(height: _S.s8),
          Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 13,
              height: 1.25,
              fontWeight: FontWeight.w600,
              color: ProfileTab._muted,
            ),
          ),
        ],
      ],
    );
  }
}

class _KeyValue extends StatelessWidget {
  final String label;
  final String value;
  final bool dense;

  const _KeyValue({
    required this.label,
    required this.value,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: 13,
      height: 1.25,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );

    final valueStyle = TextStyle(
      fontSize: dense ? 13 : 13.5,
      height: 1.45,
      fontWeight: FontWeight.w600,
      color: dense ? Colors.black : ProfileTab._muted,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 4),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class _LinkText extends StatelessWidget {
  final String text;
  final void Function(BuildContext context) onTap;

  const _LinkText({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _HoverInk(
      borderRadius: 10,
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13.5,
            height: 1.25,
            fontWeight: FontWeight.w800,
            color: ProfileTab._primary,
          ),
        ),
      ),
    );
  }
}

class _SimpleRow extends StatelessWidget {
  final String text;
  final void Function(BuildContext context) onTap;

  const _SimpleRow({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _HoverInk(
      borderRadius: 0,
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _S.s16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: ProfileTab._muted,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: ProfileTab._muted2,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final void Function(BuildContext context) onTap;

  const _ListRow({
    required this.leading,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _HoverInk(
      borderRadius: 10,
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 2),
            Padding(padding: const EdgeInsets.only(top: 6), child: leading),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.35,
                  fontWeight: FontWeight.w600,
                  color: ProfileTab._muted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: ProfileTab._muted2,
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String url;
  const _Avatar({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ProfileTab._border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFFE9EDF2),
            alignment: Alignment.center,
            child: const Icon(Icons.person, color: ProfileTab._muted2),
          ),
          loadingBuilder: (c, w, p) => p == null
              ? w
              : Container(
                  color: const Color(0xFFE9EDF2),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
        ),
      ),
    );
  }
}
