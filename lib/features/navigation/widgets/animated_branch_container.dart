import 'package:flutter/material.dart';

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final navigator = entry.value;
        return AnimatedSlide(
          offset: currentIndex == index
              ? const Offset(0, 0)
              : index > currentIndex
                  ? const Offset(1, 0)
                  : const Offset(-1, 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: _branchNavigatorWrapper(index, navigator),
        );
      }).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(enabled: index == currentIndex, child: navigator),
      );
}