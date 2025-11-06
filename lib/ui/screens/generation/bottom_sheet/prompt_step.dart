import 'package:audiomancy_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PromptStep extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onNext;

  const PromptStep({super.key, required this.controller, required this.onNext});

  @override
  State<PromptStep> createState() => _PromptStepState();
}

class _PromptStepState extends State<PromptStep> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // ✅ Correction : forcer le recalcul du layout et rafraîchir le scroll après affichage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {}); // Force rebuild pour activer le scroll dès la première frame
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Décrivez votre playlist idéale',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: AppColors.eclatEther,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: widget.controller,
              style: const TextStyle(color: AppColors.luneVoilee),
              decoration: const InputDecoration(
                hintText: 'Ex: Rock énergique pour le sport...',
                hintStyle: TextStyle(color: AppColors.luneVoilee),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.amethyseMagique),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.vertDragon),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: widget.onNext,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.vertDragon,
                  foregroundColor: AppColors.brumeCosmique,
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Suivant'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}