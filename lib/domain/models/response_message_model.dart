class ResponseMessageModel<T> {
  T? data;
  List<String> messages = [];
  bool ok = true;

  ResponseMessageModel();

  addInputDataError(String message) {
    messages.add(message);
    ok = false;
  }

  addInternalError(String message) {
    messages.add(message);
    ok = false;
  }
}
