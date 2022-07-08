package com.liang.bbs.rest.interceptor;


import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.basic.ResponseResult;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.rpc.RpcException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.ExecutionException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 全局异常处理程序
 *
 * @author 马亮南生
 * @date 2021-04-20 22:25
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
    private static final String BUSINESS_CODE_REG = "\\(code=(.*), desc=";
    private static final Pattern BUSINESS_CODE_PATTERN = Pattern.compile(BUSINESS_CODE_REG);

    /**
     * 业务异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = BusinessException.class)
    @ResponseBody
    public ResponseResult<String> businessExceptionHandler(HttpServletRequest req, BusinessException e) {
        log.error("业务异常:", e);
        return ResponseResult.<String>builder().code(e.getResponseCode().getCode()).desc(e.getMessage()).build();
    }

    /**
     * dubbo将所有执行异常包装到ExecutionException中
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = ExecutionException.class)
    @ResponseBody
    public ResponseResult<String> businessExceptionHandler(HttpServletRequest req, ExecutionException e) {
        String message = e.getMessage();
        log.error("远程调用出现异常:", e);
        if (StringUtils.isNotEmpty(message) && message.contains("BusinessException")) {
            Matcher mat = BUSINESS_CODE_PATTERN.matcher(message);
            if (mat.find()) {
                ResponseCode responseCode = ResponseCode.getByCode(Integer.valueOf(mat.group(1)));
                assert responseCode != null;
                return ResponseResult.build(responseCode, "");
            }
        }
        return ResponseResult.<String>builder().code(ResponseCode.RPC_EXCEPTION.getCode()).desc(ResponseCode.RPC_EXCEPTION.getDesc()).build();
    }

    /**
     * 参数校验异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = BindException.class)
    @ResponseBody
    public ResponseResult<String> defaultHandler(HttpServletRequest req, BindException e) {
        log.error("参数校验异常:", e);
        return ResponseResult.<String>builder().code(ResponseCode.BIND_EXCEPTION.getCode()).desc(ResponseCode.BIND_EXCEPTION.getDesc()).build();
    }

    /**
     * 方法参数无效异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    @ResponseBody
    public ResponseResult<String> defaultHandler(HttpServletRequest req, MethodArgumentNotValidException e) {
        log.error("方法参数无效异常:", e);
        return ResponseResult.<String>builder().code(ResponseCode.RPC_EXCEPTION.getCode()).desc(ResponseCode.RPC_EXCEPTION.getDesc()).build();
    }

    /**
     * 缺少请求参数异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = MissingServletRequestParameterException.class)
    @ResponseBody
    public ResponseResult<String> defaultHandler(HttpServletRequest req, MissingServletRequestParameterException e) {
        log.error("缺少请求参数异常", e);
        return ResponseResult.<String>builder().code(ResponseCode.MISSING_PARAMETER_EXCEPTION.getCode()).desc(ResponseCode.MISSING_PARAMETER_EXCEPTION.getDesc()).build();
    }

    /**
     * RPC异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = RpcException.class)
    @ResponseBody
    public ResponseResult<String> defaultHandler(HttpServletRequest req, RpcException e) {
        log.error("RPC异常:", e);
        return ResponseResult.<String>builder().code(ResponseCode.RPC_EXCEPTION.getCode()).desc(ResponseCode.RPC_EXCEPTION.getDesc()).build();
    }

    /**
     * 其它异常
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResponseResult<String> defaultHandler(HttpServletRequest req, Exception e) {
        if (e instanceof ExecutionException || e instanceof InterruptedException) {
            return businessExceptionHandler(req, new ExecutionException(e));
        } else {
            log.error("其它异常:", e);
            return ResponseResult.<String>builder().code(ResponseCode.SYSTEM_EXCEPTION.getCode()).desc(ResponseCode.SYSTEM_EXCEPTION.getDesc()).build();

        }

    }

}
