package com.ems.exception;

import com.ems.mode.ConsoleResultModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.annotation.Resource;
import java.util.Locale;

/**
 * 公共异常处理
 */

@RestControllerAdvice
public class CommonExceptionResolver{


	@Resource
	protected MessageSource messageSource;

	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@ExceptionHandler(value = Exception.class)
	@ResponseBody
	public ConsoleResultModel ErrorHandler(Exception exception) {
		logger.error("",exception);
		ConsoleResultModel<String> resultModel = new ConsoleResultModel<>();
		resultModel.setSuccess(false);
		resultModel.setErrorCode("500");
		resultModel.setErrorInfo("系统异常");
		if (exception instanceof CommonException) {
			CommonException commonException = (CommonException) exception;
			resultModel.setErrorCode(commonException.getErrorCode());
			Locale local=Locale.CHINESE;
			resultModel.setErrorInfo(messageSource.getMessage(commonException.getErrorCode(),null,local));
		}
		return resultModel;
	}


}
