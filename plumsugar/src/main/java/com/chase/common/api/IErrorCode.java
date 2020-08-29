package com.chase.common.api;

/**
 * 封装API的错误码
 * @author chase
 */
public interface IErrorCode {
    long getCode();

    String getMessage();
}
