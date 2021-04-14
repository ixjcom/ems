package com.ems.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class CommonException extends RuntimeException{

    private String errorCode;

    public CommonException(String errorCode, Throwable cause) {
        super(cause);
        this.errorCode = errorCode;
    }

    public CommonException(String errorCode) {
        this.errorCode = errorCode;
    }

    public CommonException(Throwable cause) {
        super(cause);
    }

    public CommonException(String errorCode, String errorMsg) {
        super(errorMsg);
        this.errorCode = errorCode;
    }

    public CommonException(String errorCode, String errorMsg, Throwable cause) {
        super(errorMsg, cause);
        this.errorCode = errorCode;
    }

    public CommonException() {
        super();
    }

    public String getErrorCode() {
        return errorCode;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"errorCode\":\"")
                .append(errorCode).append('\"');
        sb.append('}');
        return sb.toString();
    }
    public static String getStackTrace(Throwable throwable)
    {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);

        try
        {
            throwable.printStackTrace(pw);
            return sw.toString();
        } finally
        {
            pw.close();
        }
    }


}
