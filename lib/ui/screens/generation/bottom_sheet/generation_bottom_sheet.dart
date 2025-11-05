import 'package:flutter/material.dart';
import 'prompt_step.dart';
import 'track_count_step.dart';

class GenerationBottomSheet extends StatefulWidget {
  const GenerationBottomSheet({super.key});

  @override
  State<GenerationBottomSheet> createState() => _GenerationBottomSheetState();
}

class _GenerationBottomSheetState extends State<GenerationBottomSheet> {
  final PageController _pageController = PageController();
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _promptController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_promptController.text.isNotEmpty) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onTrackCountSelected(int count) {
    Navigator.of(context).pop({
      'prompt': _promptController.text,
      'trackCount': count,
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(), // Empêche le swipe manuel
      children: [
        PromptStep(
          controller: _promptController,
          onNext: _goToNextPage,
        ),
        TrackCountStep(
          onTrackCountSelected: _onTrackCountSelected,
          onBack: _goToPreviousPage, // Ajout du callback pour le retour
        ),
      ],
    );
  }
}
