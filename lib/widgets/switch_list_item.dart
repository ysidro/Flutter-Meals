import 'package:flutter/material.dart';

class CustomSwitchListItem extends StatelessWidget {
  const CustomSwitchListItem({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.value, 
    required this.onChanged,
  });
  
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChanged;
  
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value, 
      onChanged: onChanged, 
      title: Text(
        title, 
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle, 
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}