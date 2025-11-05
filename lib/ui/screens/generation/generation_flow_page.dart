import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet/prompt_step.dart';
import 'bottom_sheet/track_count_step.dart';

class GenerationFlowPage extends StatefulWidget {
  const GenerationFlowPage({super.key});

  @override
  State<GenerationFlowPage> createState() => _GenerationFlowPageState();
}

class _GenerationFlowPageState extends State<GenerationFlowPage> {
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
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onTrackCountSelected(int count) {
    // On retourne le résultat à la page précédente
    Navigator.of(context).pop({
      'prompt': _promptController.text,
      'trackCount': count,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ombreOcculte,
      appBar: AppBar(
        title: const Text('Nouvelle Incantation'),
        backgroundColor: AppColors.brumeCosmique,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PromptStep(
            controller: _promptController,
            onNext: _goToNextPage,
          ),
          TrackCountStep(
            onTrackCountSelected: _onTrackCountSelected,
            onBack: _goToPreviousPage,
          ),
        ],
      ),
    );
  }
}
