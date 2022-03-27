class ApiAuth {
	String? accessToken;

	ApiAuth({this.accessToken});

	factory ApiAuth.fromJson(Map<String, dynamic> json) => ApiAuth(
				accessToken: json['access_token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'access_token': accessToken,
			};

	ApiAuth copyWith({
		String? accessToken,
	}) {
		return ApiAuth(
			accessToken: accessToken ?? this.accessToken,
		);
	}
}
