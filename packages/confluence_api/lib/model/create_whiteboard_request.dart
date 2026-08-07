//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateWhiteboardRequest {
  /// Returns a new [CreateWhiteboardRequest] instance.
  CreateWhiteboardRequest({
    required this.spaceId,
    this.title,
    this.parentId,
    this.templateKey,
    this.locale,
  });

  /// ID of the space.
  String spaceId;

  /// Title of the whiteboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The parent content ID of the whiteboard.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  /// Providing a template key will add that template to the new whiteboard.
  CreateWhiteboardRequestTemplateKeyEnum? templateKey;

  /// If templateKey is provided, locale will decide which language the template will be created with. If locale is omitted, the user's locale will be used.
  CreateWhiteboardRequestLocaleEnum? locale;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateWhiteboardRequest &&
    other.spaceId == spaceId &&
    other.title == title &&
    other.parentId == parentId &&
    other.templateKey == templateKey &&
    other.locale == locale;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spaceId.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (templateKey == null ? 0 : templateKey!.hashCode) +
    (locale == null ? 0 : locale!.hashCode);

  @override
  String toString() => 'CreateWhiteboardRequest[spaceId=$spaceId, title=$title, parentId=$parentId, templateKey=$templateKey, locale=$locale]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spaceId'] = this.spaceId;
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.templateKey != null) {
      json[r'templateKey'] = this.templateKey;
    } else {
      json[r'templateKey'] = null;
    }
    if (this.locale != null) {
      json[r'locale'] = this.locale;
    } else {
      json[r'locale'] = null;
    }
    return json;
  }

  /// Returns a new [CreateWhiteboardRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateWhiteboardRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'spaceId'), 'Required key "CreateWhiteboardRequest[spaceId]" is missing from JSON.');
        assert(json[r'spaceId'] != null, 'Required key "CreateWhiteboardRequest[spaceId]" has a null value in JSON.');
        return true;
      }());

      return CreateWhiteboardRequest(
        spaceId: mapValueOfType<String>(json, r'spaceId')!,
        title: mapValueOfType<String>(json, r'title'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        templateKey: CreateWhiteboardRequestTemplateKeyEnum.fromJson(json[r'templateKey']),
        locale: CreateWhiteboardRequestLocaleEnum.fromJson(json[r'locale']),
      );
    }
    return null;
  }

  static List<CreateWhiteboardRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWhiteboardRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWhiteboardRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateWhiteboardRequest> mapFromJson(dynamic json) {
    final map = <String, CreateWhiteboardRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateWhiteboardRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateWhiteboardRequest-objects as value to a dart map
  static Map<String, List<CreateWhiteboardRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateWhiteboardRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateWhiteboardRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spaceId',
  };
}

/// Providing a template key will add that template to the new whiteboard.
enum CreateWhiteboardRequestTemplateKeyEnum {
  n2x2Prioritization._(r'2x2-prioritization'),
  n4lsRetro._(r'4ls-retro'),
  annualCalendar._(r'annual-calendar'),
  brainwriting._(r'brainwriting'),
  conceptMap._(r'concept-map'),
  crazy8s._(r'crazy-8s'),
  dailySync._(r'daily-sync'),
  disruptiveBrainstorm._(r'disruptive-brainstorm'),
  dotVoting._(r'dot-voting'),
  elevatorPitch._(r'elevator-pitch'),
  flowChart._(r'flow-chart'),
  gapAnalysis._(r'gap-analysis'),
  iceBreakers._(r'ice-breakers'),
  incidentPostmortem._(r'incident-postmortem'),
  journeyMappingKit._(r'journey-mapping-kit'),
  kanbanBoard._(r'kanban-board'),
  leanCoffee._(r'lean-coffee'),
  networkOfTeams._(r'network-of-teams'),
  orgChart._(r'org-chart'),
  piPlanning._(r'pi-planning'),
  prioritization._(r'prioritization'),
  prioritizationExperiment._(r'prioritization-experiment'),
  productRoadmap._(r'product-roadmap'),
  productVisionBoard._(r'product-vision-board'),
  rice._(r'rice'),
  sailboatRetro._(r'sailboat-retro'),
  serviceBlueprint._(r'service-blueprint'),
  simpleRetrospective._(r'simple-retrospective'),
  sprintPlanning._(r'sprint-planning'),
  stickyNotePack._(r'sticky-note-pack'),
  swimlanes._(r'swimlanes'),
  teamFormationGuide._(r'team-formation-guide'),
  timeline._(r'timeline'),
  timelineWorkflow._(r'timeline-workflow'),
  userStoryMap._(r'user-story-map'),
  workflow._(r'workflow'),
  visionBoard._(r'vision-board'),
  vennDiagram._(r'venn-diagram'),
  storyboard._(r'storyboard'),
  actionPlan._(r'action-plan'),
  rootCauseAnalysis._(r'root-cause-analysis'),
  executiveSummary._(r'executive-summary'),
  stakeholderMapping._(r'stakeholder-mapping'),
  annualCalendar20252026._(r'annual-calendar-2025-2026'),
  healthMonitor._(r'health-monitor'),
  okrPlanning._(r'okr-planning'),
  swotAnalysis._(r'swot-analysis'),
  pokerPlanning._(r'poker-planning'),
  fishboneDiagram._(r'fishbone-diagram'),
  riskAssessment._(r'risk-assessment'),
  boundedContext._(r'bounded-context'),
  hopesAndFears._(r'hopes-and-fears'),
  swimlaneVertical._(r'swimlane-vertical'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateWhiteboardRequestTemplateKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateWhiteboardRequestTemplateKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateWhiteboardRequestTemplateKeyEnum? fromJson(dynamic value) => CreateWhiteboardRequestTemplateKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateWhiteboardRequestTemplateKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateWhiteboardRequestTemplateKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWhiteboardRequestTemplateKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWhiteboardRequestTemplateKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateWhiteboardRequestTemplateKeyEnum] to String,
/// and [decode] dynamic data back to [CreateWhiteboardRequestTemplateKeyEnum].
class CreateWhiteboardRequestTemplateKeyEnumTypeTransformer {
  factory CreateWhiteboardRequestTemplateKeyEnumTypeTransformer() => _instance ??= const CreateWhiteboardRequestTemplateKeyEnumTypeTransformer._();

  const CreateWhiteboardRequestTemplateKeyEnumTypeTransformer._();

  String encode(CreateWhiteboardRequestTemplateKeyEnum data) => data._value;

  /// Returns the instance of [CreateWhiteboardRequestTemplateKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateWhiteboardRequestTemplateKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateWhiteboardRequestTemplateKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'2x2-prioritization': return CreateWhiteboardRequestTemplateKeyEnum.n2x2Prioritization;
        case r'4ls-retro': return CreateWhiteboardRequestTemplateKeyEnum.n4lsRetro;
        case r'annual-calendar': return CreateWhiteboardRequestTemplateKeyEnum.annualCalendar;
        case r'brainwriting': return CreateWhiteboardRequestTemplateKeyEnum.brainwriting;
        case r'concept-map': return CreateWhiteboardRequestTemplateKeyEnum.conceptMap;
        case r'crazy-8s': return CreateWhiteboardRequestTemplateKeyEnum.crazy8s;
        case r'daily-sync': return CreateWhiteboardRequestTemplateKeyEnum.dailySync;
        case r'disruptive-brainstorm': return CreateWhiteboardRequestTemplateKeyEnum.disruptiveBrainstorm;
        case r'dot-voting': return CreateWhiteboardRequestTemplateKeyEnum.dotVoting;
        case r'elevator-pitch': return CreateWhiteboardRequestTemplateKeyEnum.elevatorPitch;
        case r'flow-chart': return CreateWhiteboardRequestTemplateKeyEnum.flowChart;
        case r'gap-analysis': return CreateWhiteboardRequestTemplateKeyEnum.gapAnalysis;
        case r'ice-breakers': return CreateWhiteboardRequestTemplateKeyEnum.iceBreakers;
        case r'incident-postmortem': return CreateWhiteboardRequestTemplateKeyEnum.incidentPostmortem;
        case r'journey-mapping-kit': return CreateWhiteboardRequestTemplateKeyEnum.journeyMappingKit;
        case r'kanban-board': return CreateWhiteboardRequestTemplateKeyEnum.kanbanBoard;
        case r'lean-coffee': return CreateWhiteboardRequestTemplateKeyEnum.leanCoffee;
        case r'network-of-teams': return CreateWhiteboardRequestTemplateKeyEnum.networkOfTeams;
        case r'org-chart': return CreateWhiteboardRequestTemplateKeyEnum.orgChart;
        case r'pi-planning': return CreateWhiteboardRequestTemplateKeyEnum.piPlanning;
        case r'prioritization': return CreateWhiteboardRequestTemplateKeyEnum.prioritization;
        case r'prioritization-experiment': return CreateWhiteboardRequestTemplateKeyEnum.prioritizationExperiment;
        case r'product-roadmap': return CreateWhiteboardRequestTemplateKeyEnum.productRoadmap;
        case r'product-vision-board': return CreateWhiteboardRequestTemplateKeyEnum.productVisionBoard;
        case r'rice': return CreateWhiteboardRequestTemplateKeyEnum.rice;
        case r'sailboat-retro': return CreateWhiteboardRequestTemplateKeyEnum.sailboatRetro;
        case r'service-blueprint': return CreateWhiteboardRequestTemplateKeyEnum.serviceBlueprint;
        case r'simple-retrospective': return CreateWhiteboardRequestTemplateKeyEnum.simpleRetrospective;
        case r'sprint-planning': return CreateWhiteboardRequestTemplateKeyEnum.sprintPlanning;
        case r'sticky-note-pack': return CreateWhiteboardRequestTemplateKeyEnum.stickyNotePack;
        case r'swimlanes': return CreateWhiteboardRequestTemplateKeyEnum.swimlanes;
        case r'team-formation-guide': return CreateWhiteboardRequestTemplateKeyEnum.teamFormationGuide;
        case r'timeline': return CreateWhiteboardRequestTemplateKeyEnum.timeline;
        case r'timeline-workflow': return CreateWhiteboardRequestTemplateKeyEnum.timelineWorkflow;
        case r'user-story-map': return CreateWhiteboardRequestTemplateKeyEnum.userStoryMap;
        case r'workflow': return CreateWhiteboardRequestTemplateKeyEnum.workflow;
        case r'vision-board': return CreateWhiteboardRequestTemplateKeyEnum.visionBoard;
        case r'venn-diagram': return CreateWhiteboardRequestTemplateKeyEnum.vennDiagram;
        case r'storyboard': return CreateWhiteboardRequestTemplateKeyEnum.storyboard;
        case r'action-plan': return CreateWhiteboardRequestTemplateKeyEnum.actionPlan;
        case r'root-cause-analysis': return CreateWhiteboardRequestTemplateKeyEnum.rootCauseAnalysis;
        case r'executive-summary': return CreateWhiteboardRequestTemplateKeyEnum.executiveSummary;
        case r'stakeholder-mapping': return CreateWhiteboardRequestTemplateKeyEnum.stakeholderMapping;
        case r'annual-calendar-2025-2026': return CreateWhiteboardRequestTemplateKeyEnum.annualCalendar20252026;
        case r'health-monitor': return CreateWhiteboardRequestTemplateKeyEnum.healthMonitor;
        case r'okr-planning': return CreateWhiteboardRequestTemplateKeyEnum.okrPlanning;
        case r'swot-analysis': return CreateWhiteboardRequestTemplateKeyEnum.swotAnalysis;
        case r'poker-planning': return CreateWhiteboardRequestTemplateKeyEnum.pokerPlanning;
        case r'fishbone-diagram': return CreateWhiteboardRequestTemplateKeyEnum.fishboneDiagram;
        case r'risk-assessment': return CreateWhiteboardRequestTemplateKeyEnum.riskAssessment;
        case r'bounded-context': return CreateWhiteboardRequestTemplateKeyEnum.boundedContext;
        case r'hopes-and-fears': return CreateWhiteboardRequestTemplateKeyEnum.hopesAndFears;
        case r'swimlane-vertical': return CreateWhiteboardRequestTemplateKeyEnum.swimlaneVertical;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateWhiteboardRequestTemplateKeyEnumTypeTransformer? _instance;
}


/// If templateKey is provided, locale will decide which language the template will be created with. If locale is omitted, the user's locale will be used.
enum CreateWhiteboardRequestLocaleEnum {
  deDE._(r'de-DE'),
  csCZ._(r'cs-CZ'),
  koKR._(r'ko-KR'),
  frFR._(r'fr-FR'),
  itIT._(r'it-IT'),
  jaJP._(r'ja-JP'),
  nlNL._(r'nl-NL'),
  nbNO._(r'nb-NO'),
  daDK._(r'da-DK'),
  svSE._(r'sv-SE'),
  fiFI._(r'fi-FI'),
  ruRU._(r'ru-RU'),
  plPL._(r'pl-PL'),
  trTR._(r'tr-TR'),
  huHU._(r'hu-HU'),
  enGB._(r'en-GB'),
  enUS._(r'en-US'),
  ptBR._(r'pt-BR'),
  zhCN._(r'zh-CN'),
  zhTW._(r'zh-TW'),
  esES._(r'es-ES'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateWhiteboardRequestLocaleEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateWhiteboardRequestLocaleEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateWhiteboardRequestLocaleEnum? fromJson(dynamic value) => CreateWhiteboardRequestLocaleEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateWhiteboardRequestLocaleEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateWhiteboardRequestLocaleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateWhiteboardRequestLocaleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateWhiteboardRequestLocaleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateWhiteboardRequestLocaleEnum] to String,
/// and [decode] dynamic data back to [CreateWhiteboardRequestLocaleEnum].
class CreateWhiteboardRequestLocaleEnumTypeTransformer {
  factory CreateWhiteboardRequestLocaleEnumTypeTransformer() => _instance ??= const CreateWhiteboardRequestLocaleEnumTypeTransformer._();

  const CreateWhiteboardRequestLocaleEnumTypeTransformer._();

  String encode(CreateWhiteboardRequestLocaleEnum data) => data._value;

  /// Returns the instance of [CreateWhiteboardRequestLocaleEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateWhiteboardRequestLocaleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateWhiteboardRequestLocaleEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'de-DE': return CreateWhiteboardRequestLocaleEnum.deDE;
        case r'cs-CZ': return CreateWhiteboardRequestLocaleEnum.csCZ;
        case r'ko-KR': return CreateWhiteboardRequestLocaleEnum.koKR;
        case r'fr-FR': return CreateWhiteboardRequestLocaleEnum.frFR;
        case r'it-IT': return CreateWhiteboardRequestLocaleEnum.itIT;
        case r'ja-JP': return CreateWhiteboardRequestLocaleEnum.jaJP;
        case r'nl-NL': return CreateWhiteboardRequestLocaleEnum.nlNL;
        case r'nb-NO': return CreateWhiteboardRequestLocaleEnum.nbNO;
        case r'da-DK': return CreateWhiteboardRequestLocaleEnum.daDK;
        case r'sv-SE': return CreateWhiteboardRequestLocaleEnum.svSE;
        case r'fi-FI': return CreateWhiteboardRequestLocaleEnum.fiFI;
        case r'ru-RU': return CreateWhiteboardRequestLocaleEnum.ruRU;
        case r'pl-PL': return CreateWhiteboardRequestLocaleEnum.plPL;
        case r'tr-TR': return CreateWhiteboardRequestLocaleEnum.trTR;
        case r'hu-HU': return CreateWhiteboardRequestLocaleEnum.huHU;
        case r'en-GB': return CreateWhiteboardRequestLocaleEnum.enGB;
        case r'en-US': return CreateWhiteboardRequestLocaleEnum.enUS;
        case r'pt-BR': return CreateWhiteboardRequestLocaleEnum.ptBR;
        case r'zh-CN': return CreateWhiteboardRequestLocaleEnum.zhCN;
        case r'zh-TW': return CreateWhiteboardRequestLocaleEnum.zhTW;
        case r'es-ES': return CreateWhiteboardRequestLocaleEnum.esES;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateWhiteboardRequestLocaleEnumTypeTransformer? _instance;
}


