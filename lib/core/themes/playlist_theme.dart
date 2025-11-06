// lib/core/themes/app_theme_extension.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class PlaylistColors extends ThemeExtension<PlaylistColors> {
  final Color background;
  final Color selected;

  const PlaylistColors({
    required this.background,
    required this.selected,
  });

  @override
  PlaylistColors copyWith({Color? background, Color? selected}) {
    return PlaylistColors(
      background: background ?? this.background,
      selected: selected ?? this.selected,
    );
  }

  @override
  PlaylistColors lerp(ThemeExtension<PlaylistColors>? other, double t) {
    if (other is! PlaylistColors) return this;
    return PlaylistColors(
      background: Color.lerp(background, other.background, t)!,
      selected: Color.lerp(selected, other.selected, t)!,
    );
  }

  // === Thèmes par défaut ===
  static const light = PlaylistColors(
    background: AppColors.playlistBackgroundLight,
    selected: AppColors.playlistSelectedLight,
  );

  static const dark = PlaylistColors(
    background: AppColors.playlistBackgroundDark,
    selected: AppColors.playlistSelectedDark,
  );
}
