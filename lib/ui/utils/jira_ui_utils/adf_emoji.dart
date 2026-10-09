/// Turning an ADF `emoji` node's attrs into the character it stands for.
///
/// Only `shortName` is required on an emoji node — `id` and `text` are both
/// optional, and Jira leaves them out on comments written by some clients:
///
/// ```json
/// {"type": "emoji", "attrs": {"shortName": ":clap:"}}
/// ```
///
/// `text`, when it is there, already is the character and is simply used.
/// Failing that, `id` carries the codepoints for a standard emoji, and the
/// shortname table below covers the case where neither is present. Anything
/// unresolved returns null, which the renderer shows as the shortname itself —
/// `:clap:` reads as *something*, where an empty span reads as a bug.
///
/// This decodes `id` itself rather than calling `decodeConfluenceEmoji`: that
/// one is for a space icon's stored value, which may be a Map wrapper or an
/// already-decoded character, neither of which an ADF `id` ever is.
library;

/// The character the `attrs` of an `emoji` node stand for, or null when it is
/// an Atlassian or site emoji with no Unicode equivalent to fall back to.
String? adfEmojiCharacter(Map? attrs) {
  if (attrs == null) return null;

  final text = attrs['text']?.toString().trim();
  // A standard emoji's `text` is the character. An Atlassian one repeats its
  // shortname there instead, which is no better than what the caller already
  // has — so it is left to the table and the caller's own fallback.
  if (text != null && text.isNotEmpty && !_isShortName(text)) return text;

  final fromId = _fromCodepoints(attrs['id']?.toString());
  if (fromId != null) return fromId;

  final shortName = attrs['shortName']?.toString();
  return shortName == null ? null : emojiForShortName(shortName);
}

/// The character a shortname such as `:clap:` names, or null when the table
/// below does not have it.
///
/// A skin tone is honoured when the base emoji is known: Atlassian writes one
/// as a second shortname glued to the first, `:clap::skin-tone-3:`.
String? emojiForShortName(String shortName) {
  var name = shortName.trim().toLowerCase();
  if (name.isEmpty) return null;
  if (!name.startsWith(':')) name = ':$name';
  if (!name.endsWith(':')) name = '$name:';

  final toned = RegExp(r'^(:[^:]+:):skin-tone-([2-6]):$').firstMatch(name);
  if (toned != null) {
    final base = _byShortName[toned.group(1)!];
    if (base == null) return null;
    // Tone 1 is the default yellow and carries no modifier, so tone 2 is the
    // first of the five Fitzpatrick modifiers at U+1F3FB.
    return base + String.fromCharCode(0x1f3f9 + int.parse(toned.group(2)!));
  }

  return _byShortName[name];
}

/// True for a value that is a shortname rather than a character.
bool _isShortName(String value) => value.length > 2 && value.startsWith(':') && value.endsWith(':');

/// A standard emoji's `id` is its codepoints in hex, joined by dashes when it
/// is built from several — `1f44f`, or `1f468-200d-1f4bb`. An Atlassian emoji's
/// id is a name like `atlassian-check_mark` instead, and returns null here.
String? _fromCodepoints(String? id) {
  if (id == null || id.isEmpty) return null;
  if (!RegExp(r'^[0-9a-fA-F]+(-[0-9a-fA-F]+)*$').hasMatch(id)) return null;

  final codePoints = <int>[];
  for (final part in id.split('-')) {
    final point = int.tryParse(part, radix: 16);
    // Outside Unicode's range it would throw in fromCharCodes.
    if (point == null || point > 0x10ffff) return null;
    codePoints.add(point);
  }
  return codePoints.isEmpty ? null : String.fromCharCodes(codePoints);
}

/// The standard emoji Jira's own picker offers, by shortname.
///
/// Not the whole Unicode set — that is a few thousand entries and most of them
/// never appear in a work item — but every reaction and marker a comment
/// realistically uses, plus the aliases Atlassian accepts for them. A miss
/// costs nothing: the renderer falls back to showing the shortname.
///
/// Written as escapes rather than characters so the invisible pieces are
/// visible here: U+FE0F is the variation selector that asks for the colourful
/// emoji glyph instead of the monochrome dingbat a bare codepoint would get.
const Map<String, String> _byShortName = {
  // Hands and gestures — the reactions a comment thread is mostly made of.
  ':clap:': '\u{1f44f}',
  ':thumbsup:': '\u{1f44d}',
  ':+1:': '\u{1f44d}',
  ':thumbsdown:': '\u{1f44e}',
  ':-1:': '\u{1f44e}',
  ':wave:': '\u{1f44b}',
  ':ok_hand:': '\u{1f44c}',
  ':raised_hands:': '\u{1f64c}',
  ':raising_hand:': '\u{1f64b}',
  ':pray:': '\u{1f64f}',
  ':muscle:': '\u{1f4aa}',
  ':punch:': '\u{1f44a}',
  ':fist:': '\u{270a}',
  ':v:': '\u{270c}\u{fe0f}',
  ':crossed_fingers:': '\u{1f91e}',
  ':handshake:': '\u{1f91d}',
  ':writing_hand:': '\u{270d}\u{fe0f}',
  ':point_up:': '\u{261d}\u{fe0f}',
  ':point_up_2:': '\u{1f446}',
  ':point_down:': '\u{1f447}',
  ':point_left:': '\u{1f448}',
  ':point_right:': '\u{1f449}',
  ':shrug:': '\u{1f937}',
  ':person_shrugging:': '\u{1f937}',
  ':facepalm:': '\u{1f926}',
  ':face_palm:': '\u{1f926}',
  ':bow:': '\u{1f647}',
  ':eyes:': '\u{1f440}',
  ':eye:': '\u{1f441}\u{fe0f}',
  ':brain:': '\u{1f9e0}',
  ':dancer:': '\u{1f483}',
  ':running:': '\u{1f3c3}',
  ':detective:': '\u{1f575}\u{fe0f}',

  // Faces.
  ':grinning:': '\u{1f600}',
  ':smiley:': '\u{1f603}',
  ':smile:': '\u{1f604}',
  ':grin:': '\u{1f601}',
  ':laughing:': '\u{1f606}',
  ':satisfied:': '\u{1f606}',
  ':sweat_smile:': '\u{1f605}',
  ':joy:': '\u{1f602}',
  ':rofl:': '\u{1f923}',
  ':slight_smile:': '\u{1f642}',
  ':slightly_smiling_face:': '\u{1f642}',
  ':upside_down:': '\u{1f643}',
  ':wink:': '\u{1f609}',
  ':blush:': '\u{1f60a}',
  ':yum:': '\u{1f60b}',
  ':sunglasses:': '\u{1f60e}',
  ':heart_eyes:': '\u{1f60d}',
  ':kissing_heart:': '\u{1f618}',
  ':star_struck:': '\u{1f929}',
  ':partying_face:': '\u{1f973}',
  ':thinking:': '\u{1f914}',
  ':face_with_monocle:': '\u{1f9d0}',
  ':nerd:': '\u{1f913}',
  ':exploding_head:': '\u{1f92f}',
  ':zipper_mouth:': '\u{1f910}',
  ':neutral_face:': '\u{1f610}',
  ':expressionless:': '\u{1f611}',
  ':no_mouth:': '\u{1f636}',
  ':smirk:': '\u{1f60f}',
  ':unamused:': '\u{1f612}',
  ':grimacing:': '\u{1f62c}',
  ':relieved:': '\u{1f60c}',
  ':pensive:': '\u{1f614}',
  ':disappointed:': '\u{1f61e}',
  ':confused:': '\u{1f615}',
  ':worried:': '\u{1f61f}',
  ':cry:': '\u{1f622}',
  ':sob:': '\u{1f62d}',
  ':sweat:': '\u{1f613}',
  ':weary:': '\u{1f629}',
  ':tired_face:': '\u{1f62b}',
  ':triumph:': '\u{1f624}',
  ':angry:': '\u{1f620}',
  ':rage:': '\u{1f621}',
  ':fearful:': '\u{1f628}',
  ':scream:': '\u{1f631}',
  ':flushed:': '\u{1f633}',
  ':astonished:': '\u{1f632}',
  ':open_mouth:': '\u{1f62e}',
  ':hushed:': '\u{1f62f}',
  ':sleepy:': '\u{1f62a}',
  ':sleeping:': '\u{1f634}',
  ':see_no_evil:': '\u{1f648}',
  ':hear_no_evil:': '\u{1f649}',
  ':speak_no_evil:': '\u{1f64a}',
  ':skull:': '\u{1f480}',
  ':ghost:': '\u{1f47b}',
  ':alien:': '\u{1f47d}',
  ':robot:': '\u{1f916}',
  ':clown:': '\u{1f921}',
  ':poop:': '\u{1f4a9}',
  ':hankey:': '\u{1f4a9}',

  // Marks and symbols — the ones a status update leans on.
  ':white_check_mark:': '\u{2705}',
  ':heavy_check_mark:': '\u{2714}\u{fe0f}',
  ':ballot_box_with_check:': '\u{2611}\u{fe0f}',
  ':x:': '\u{274c}',
  ':negative_squared_cross_mark:': '\u{274e}',
  ':heavy_multiplication_x:': '\u{2716}\u{fe0f}',
  ':warning:': '\u{26a0}\u{fe0f}',
  ':no_entry:': '\u{26d4}',
  ':no_entry_sign:': '\u{1f6ab}',
  ':question:': '\u{2753}',
  ':grey_question:': '\u{2754}',
  ':exclamation:': '\u{2757}',
  ':grey_exclamation:': '\u{2755}',
  ':bangbang:': '\u{203c}\u{fe0f}',
  ':interrobang:': '\u{2049}\u{fe0f}',
  ':heavy_plus_sign:': '\u{2795}',
  ':heavy_minus_sign:': '\u{2796}',
  ':heavy_division_sign:': '\u{2797}',
  ':100:': '\u{1f4af}',
  ':sos:': '\u{1f198}',
  ':ok:': '\u{1f197}',
  ':new:': '\u{1f195}',
  ':up:': '\u{1f199}',
  ':free:': '\u{1f193}',
  ':arrow_up:': '\u{2b06}\u{fe0f}',
  ':arrow_down:': '\u{2b07}\u{fe0f}',
  ':arrow_left:': '\u{2b05}\u{fe0f}',
  ':arrow_right:': '\u{27a1}\u{fe0f}',
  ':recycle:': '\u{267b}\u{fe0f}',
  ':sparkles:': '\u{2728}',
  ':star:': '\u{2b50}',
  ':star2:': '\u{1f31f}',
  ':zap:': '\u{26a1}',
  ':boom:': '\u{1f4a5}',
  ':fire:': '\u{1f525}',
  ':snowflake:': '\u{2744}\u{fe0f}',
  ':heart:': '\u{2764}\u{fe0f}',
  ':broken_heart:': '\u{1f494}',
  ':tada:': '\u{1f389}',
  ':confetti_ball:': '\u{1f38a}',
  ':balloon:': '\u{1f388}',
  ':gift:': '\u{1f381}',
  ':trophy:': '\u{1f3c6}',
  ':medal:': '\u{1f3c5}',
  ':first_place_medal:': '\u{1f947}',
  ':crown:': '\u{1f451}',

  // Things — tools, documents, and the rest of a work item's vocabulary.
  ':rocket:': '\u{1f680}',
  ':bug:': '\u{1f41b}',
  ':ant:': '\u{1f41c}',
  ':spider:': '\u{1f577}\u{fe0f}',
  ':snail:': '\u{1f40c}',
  ':turtle:': '\u{1f422}',
  ':computer:': '\u{1f4bb}',
  ':desktop:': '\u{1f5a5}\u{fe0f}',
  ':keyboard:': '\u{2328}\u{fe0f}',
  ':iphone:': '\u{1f4f1}',
  ':bulb:': '\u{1f4a1}',
  ':mag:': '\u{1f50d}',
  ':mag_right:': '\u{1f50e}',
  ':lock:': '\u{1f512}',
  ':unlock:': '\u{1f513}',
  ':key:': '\u{1f511}',
  ':wrench:': '\u{1f527}',
  ':hammer:': '\u{1f528}',
  ':hammer_and_wrench:': '\u{1f6e0}\u{fe0f}',
  ':gear:': '\u{2699}\u{fe0f}',
  ':nut_and_bolt:': '\u{1f529}',
  ':link:': '\u{1f517}',
  ':paperclip:': '\u{1f4ce}',
  ':pushpin:': '\u{1f4cc}',
  ':round_pushpin:': '\u{1f4cd}',
  ':calendar:': '\u{1f4c5}',
  ':date:': '\u{1f4c6}',
  ':alarm_clock:': '\u{23f0}',
  ':stopwatch:': '\u{23f1}\u{fe0f}',
  ':hourglass:': '\u{231b}',
  ':hourglass_flowing_sand:': '\u{23f3}',
  ':watch:': '\u{231a}',
  ':chart_with_upwards_trend:': '\u{1f4c8}',
  ':chart_with_downwards_trend:': '\u{1f4c9}',
  ':bar_chart:': '\u{1f4ca}',
  ':clipboard:': '\u{1f4cb}',
  ':memo:': '\u{1f4dd}',
  ':pencil:': '\u{1f4dd}',
  ':pencil2:': '\u{270f}\u{fe0f}',
  ':book:': '\u{1f4d6}',
  ':books:': '\u{1f4da}',
  ':scroll:': '\u{1f4dc}',
  ':page_facing_up:': '\u{1f4c4}',
  ':file_folder:': '\u{1f4c1}',
  ':open_file_folder:': '\u{1f4c2}',
  ':package:': '\u{1f4e6}',
  ':inbox_tray:': '\u{1f4e5}',
  ':outbox_tray:': '\u{1f4e4}',
  ':email:': '\u{2709}\u{fe0f}',
  ':envelope:': '\u{2709}\u{fe0f}',
  ':mailbox:': '\u{1f4eb}',
  ':bell:': '\u{1f514}',
  ':no_bell:': '\u{1f515}',
  ':loudspeaker:': '\u{1f4e2}',
  ':mega:': '\u{1f4e3}',
  ':speech_balloon:': '\u{1f4ac}',
  ':thought_balloon:': '\u{1f4ad}',
  ':construction:': '\u{1f6a7}',
  ':traffic_light:': '\u{1f6a6}',
  ':checkered_flag:': '\u{1f3c1}',
  ':triangular_flag_on_post:': '\u{1f6a9}',
  ':white_flag:': '\u{1f3f3}\u{fe0f}',
  ':dart:': '\u{1f3af}',
  ':game_die:': '\u{1f3b2}',
  ':microscope:': '\u{1f52c}',
  ':telescope:': '\u{1f52d}',
  ':test_tube:': '\u{1f9ea}',
  ':magnet:': '\u{1f9f2}',
  ':compass:': '\u{1f9ed}',
  ':broom:': '\u{1f9f9}',
  ':ice_cube:': '\u{1f9ca}',
  ':pill:': '\u{1f48a}',
  ':syringe:': '\u{1f489}',
  ':moneybag:': '\u{1f4b0}',
  ':money_with_wings:': '\u{1f4b8}',
  ':coffee:': '\u{2615}',
  ':beer:': '\u{1f37a}',
  ':beers:': '\u{1f37b}',
  ':pizza:': '\u{1f355}',
  ':popcorn:': '\u{1f37f}',
  ':cake:': '\u{1f370}',
  ':birthday:': '\u{1f382}',
  ':sunny:': '\u{2600}\u{fe0f}',
  ':cloud:': '\u{2601}\u{fe0f}',
  ':rainbow:': '\u{1f308}',
  ':airplane:': '\u{2708}\u{fe0f}',
  ':ship:': '\u{1f6a2}',
  ':car:': '\u{1f697}',
  ':bike:': '\u{1f6b2}',
};
