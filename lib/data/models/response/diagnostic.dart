
class Diagnostic {

  int status;
  String message;

	Diagnostic.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['message'] = message;
		return data;
	}
}
