abstract class AppEnvironment{
  static String headerKey;
  static String baseApiurl;
  static setupEnv( Environment env)
  {switch(env){
    case Environment.dev:
      headerKey='Authorisation';
      baseApiurl='https://harsh-todo-api.herokuapp.com';
      break;
    case Environment.prod:
      headerKey='Authorisation';
      baseApiurl='https://harsh-todo-api.herokuapp.com';
      break;
  }}

}
enum Environment{
  dev,prod
}