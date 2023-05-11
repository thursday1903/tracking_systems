package com.system.modals.customize;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CheckBalanceVMS {
//	{"status":0,"message":"Successfull","telcoStatus":"","balance":86000}
	int status;
	String message;
	String telcoStatus;
	Long balance;
}
