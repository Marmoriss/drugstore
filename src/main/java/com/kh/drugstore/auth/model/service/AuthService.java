package com.kh.drugstore.auth.model.service;

import lombok.NonNull;

public interface AuthService {

	int insertAuth(@NonNull String memberId);

}
