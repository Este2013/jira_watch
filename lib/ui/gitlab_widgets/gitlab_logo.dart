import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String _outlineAsset = 'assets/icons/gitlab-tanuki-outline.svg';
const String _filledAsset = 'assets/icons/gitlab-tanuki-filled.svg';
const String _colorAsset = 'assets/icons/gitlab-tanuki-color.svg';

/// The GitLab tanuki as a navigation icon, outlined when unselected and filling
/// in when selected.
///
/// Material Symbols do this through their variable `fill` axis, which
/// `IconFilledOnSelection` animates via `IconTheme`. That has no effect on an
/// `SvgPicture`, so the two states are separate assets — the same path stroked
/// and filled — cross-faded on the same curve and duration, so it sits alongside
/// the Material icons without looking out of place.
class GitLabTanukiIcon extends StatelessWidget {
  const GitLabTanukiIcon({super.key, required this.isSelected, this.size});

  final bool isSelected;

  /// Defaults to the surrounding [IconTheme]'s size, like an [Icon] would.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final dimension = size ?? iconTheme.size ?? 24;
    final color = (iconTheme.color ?? Theme.of(context).colorScheme.onSurface).withValues(
      alpha: iconTheme.opacity ?? 1,
    );
    final filter = ColorFilter.mode(color, BlendMode.srcIn);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: isSelected ? 0 : 1, end: isSelected ? 1 : 0),
      duration: Durations.medium1,
      builder: (context, fill, _) => SizedBox.square(
        dimension: dimension,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(_outlineAsset, colorFilter: filter),
            // Layered over the outline rather than cross-faded against it: both
            // are the same silhouette, so fading one out as the other rises
            // would dip in the middle of the transition.
            Opacity(opacity: fill, child: SvgPicture.asset(_filledAsset, colorFilter: filter)),
          ],
        ),
      ),
    );
  }
}

/// The full-colour tanuki, for places that want the brand mark rather than an icon.
class GitLabTanukiLogo extends StatelessWidget {
  const GitLabTanukiLogo({super.key, this.size = 72});

  final double size;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    _colorAsset,
    width: size,
    height: size,
    semanticsLabel: 'GitLab',
  );
}
