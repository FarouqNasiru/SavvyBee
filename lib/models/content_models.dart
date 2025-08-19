class ContentSection {
  final String type; // 'title', 'subtitle', 'paragraph', 'list', 'numbered_list', 'dropdown'
  final String? text;
  final String? header;
  final String? body;
  final List<String>? items;

  const ContentSection({
    required this.type,
    this.text,
    this.header,
    this.body,
    this.items,
  });
}

class StageContent {
  final List<String> cardTexts;
  final List<ContentSection> readingSections;

  const StageContent({
    required this.cardTexts,
    required this.readingSections,
  });
}
