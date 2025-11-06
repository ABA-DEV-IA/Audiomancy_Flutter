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
  final ValueNotifier<bool> _ready = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    // 🧠 Attendre que la transition soit terminée avant d'afficher le contenu
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        const Duration(milliseconds: 250),
      ); // Attendre fin de l'animation
      if (mounted) _ready.value = true;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _promptController.dispose();
    _ready.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    FocusScope.of(context).unfocus(); // Ferme le clavier
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
    Navigator.of(context).pop({
      'prompt': _promptController.text,
      'trackCount': count,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔮 Audiomancy'),
        elevation: 0,
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _ready,
        builder: (context, ready, _) {
          if (!ready) {
            // Pendant l'animation → évite le bug de layout
            return const Center(child: CircularProgressIndicator());
          }
          return PageView(
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
          );
        },
      ),
    );
  }
}
