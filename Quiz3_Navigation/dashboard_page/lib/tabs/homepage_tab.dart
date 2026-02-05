import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static const _bg = Color(0xFFF4F6F8);
  static const _cardRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    final courses = [
      _Course(
        tag: "S1BM",
        title: "READING AND WRITING",
        code: "(FAHRI-UNI1W04-S1BM24_4A-K)",
        img:
            "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=1200&q=60",
      ),
      _Course(
        tag: "S1ESE",
        title: "MOBILE APPLICATION DEVELOPMENT",
        code: "(PNM-ESEU2220-S1DBT24_4K)",
        img:
            "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1200&q=60",
      ),
      _Course(
        tag: "S1ESE",
        title: "AGILE PROJECT MANAGEMENT",
        code: "(EAR-ESEU2222-S1DBT24_4K)",
        img:
            "https://images.unsplash.com/photo-1553877522-43269d4ea984?auto=format&fit=crop&w=1200&q=60",
      ),
      _Course(
        tag: "S1ESE",
        title: "SUSTAINABLE DEVELOPMENT",
        code: "(DHA-STEM1217-S1DBT24_4K)",
        img:
            "https://images.unsplash.com/photo-1520975693411-bb8b8e58d1ea?auto=format&fit=crop&w=1200&q=60",
      ),
      _Course(
        tag: "S1ESE",
        title: "COMPUTER NETWORK AND SECURITY",
        code: "(HLW-ESEU2212-S1DBT24_4K)",
        img:
            "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=1200&q=60",
      ),
      _Course(
        tag: "S1ESE",
        title: "INTERMEDIATE DATABASE SYSTEM",
        code: "(SAM-ESEU2226-S1DBT24_4K)",
        img:
            "https://images.unsplash.com/photo-1555949963-aa79dcee981c?auto=format&fit=crop&w=1200&q=60",
      ),
    ];

    return Container(
      color: _bg,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        children: [
          const Text(
            "Hi, 23502410003! 👋",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 18),

          const Text(
            "Recently accessed courses",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),

          _CourseRow(courses: courses),

          const SizedBox(height: 22),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Calendar",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              _DropdownStub(),
            ],
          ),
          const SizedBox(height: 10),

          _CalendarStub(radius: _cardRadius),
        ],
      ),
    );
  }
}

class _CourseRow extends StatelessWidget {
  final List<_Course> courses;
  const _CourseRow({required this.courses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) => _CourseCard(course: courses[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final _Course course;
  const _CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Material(
        color: Colors.white,
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image header
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      course.img,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (c, w, p) => p == null
                          ? w
                          : Container(
                              height: 120,
                              color: const Color(0xFFE9EDF2),
                              alignment: Alignment.center,
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                      errorBuilder: (_, __, ___) => Container(
                        height: 120,
                        color: const Color(0xFFE9EDF2),
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image_outlined),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          course.tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      course.code,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Course {
  final String tag;
  final String title;
  final String code;
  final String img;
  const _Course({
    required this.tag,
    required this.title,
    required this.code,
    required this.img,
  });
}

class _DropdownStub extends StatelessWidget {
  const _DropdownStub();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E6EA)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "All courses",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}

class _CalendarStub extends StatelessWidget {
  final double radius;
  const _CalendarStub({required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: const Color(0xFFE2E6EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "February 2026",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          _calendarGrid(),
        ],
      ),
    );
  }

  Widget _calendarGrid() {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Column(
      children: [
        Row(
          children: days
              .map(
                (d) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      d,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const Divider(height: 1),
        const SizedBox(height: 10),
        // dummy rows
        for (int r = 0; r < 3; r++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: List.generate(
                7,
                (i) => Expanded(
                  child: Container(
                    height: 44,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE9EDF2)),
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFFBFCFD),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
