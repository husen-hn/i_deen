//
//  app_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

abstract class IAppRepository {
  // StatusErrorHandlerSchema statusErrorHandler(Response? response);
}

class AppRepository implements IAppRepository {
  AppRepository();

  // @override
  // StatusErrorHandlerSchema statusErrorHandler(Response? response) {
  //   switch (response?.statusCode) {
  //     case 500:
  //       return StatusErrorHandlerSchema(
  //           message: "Server Error pls retry later");
  //     case 400:
  //       return StatusErrorHandlerSchema(message: 'Bad Request!');
  //     case 401:
  //       return StatusErrorHandlerSchema(message: 'Unauthorized!');
  //     case 403:
  //       return StatusErrorHandlerSchema(
  //           message: 'Error occurred pls check internet and retry.');
  //     case 404:
  //       return StatusErrorHandlerSchema(message: 'Not Found!');
  //     default:
  //       return StatusErrorHandlerSchema(message: 'Error occurred!');
  //   }
  // }
}
