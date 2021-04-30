import 'package:graphql_flutter/graphql_flutter.dart';

class BaseClient {

  final String url = 'https://hagglex-backend-staging.herokuapp.com/graphql';

  GraphQLClient getUnauthorizedClient() {
    final Link httpLink = HttpLink(
      url,
    );

    return GraphQLClient(
      //Use HiveStore to persist data
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );
  }


  GraphQLClient getAuthorizedClient(String token){
    final HttpLink httpLink = HttpLink(
      url,
    );


    final AuthLink authLink = AuthLink(
      getToken: () async{

        return 'Bearer $token';

        },

    );

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      //Use HiveStore to persist data
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    );
  }
}