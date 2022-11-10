package kesheTest.common;

public class Resp<T>  {
    private static final int DEFAULT_OK = 200;
    private static final int DEFAULT_ERROR = -1;

    private final Integer code;
    private final T data;
    private final String msg;

    private Resp(Integer code, T data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }

    public static <T> Resp<T> success(T data) {
        return new Resp<T>(DEFAULT_OK, data, "");
    }

    public static <T> Resp<T> error(String msg) {
        return new Resp<T>(DEFAULT_ERROR, null, msg);
    }

    public static <T> Resp<T> error(Integer code, String msg) {
        return new Resp<T>(code, null, msg);
    }

    public Integer getCode() {
        return code;
    }

    public T getData() {
        return data;
    }

    public String getMsg() {
        return msg;
    }
}