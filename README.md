
```markdown
# expandable_text_plus

A Flutter widget that displays text which can be expanded or collapsed with a "Read more" / "Show less" link.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  expandable_text_plus: ^1.0.0
  
```dart
ExpandableText(
  text: "This is a long text that will be truncated after 2 lines...",
  maxLines: 2,
  textStyle: const TextStyle(fontSize: 16, color: Colors.black),
  linkStyle: const TextStyle(color: Colors.red),
)
