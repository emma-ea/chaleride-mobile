class EnvironmentConfig {

  static const ENVIRONMENT_FLAVOR = String.fromEnvironment(
      'ENVIRONMENT_FLAVOR',
      defaultValue: 'DEV'
  );

}