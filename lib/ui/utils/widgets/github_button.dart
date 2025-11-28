
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenInGitHubButton extends StatelessWidget {
  const OpenInGitHubButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextButton.icon(
             onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch')),
             icon: SvgPicture.asset(
               'assets/icons/github-icon.svg',
               height: 20,
               colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
             ),
             label: Text('GitHub'),
           );
}