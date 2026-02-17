class SelectionOption {
  final String label;
  final bool selected;

  const SelectionOption({required this.label, this.selected = false});

  SelectionOption copyWith({String? label, bool? selected}) {
    return SelectionOption(
      label: label ?? this.label,
      selected: selected ?? this.selected,
    );
  }
}
