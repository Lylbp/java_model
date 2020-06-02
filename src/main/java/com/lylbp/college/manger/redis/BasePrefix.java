package com.lylbp.college.manger.redis;
import lombok.Data;

@Data
public class BasePrefix{
    /**
     * 过期时间
     */
    private int expireSeconds;

    /**
     * 前缀
     */
    private String prefix;

    public BasePrefix(int expireSeconds, String prefix) {
        this.expireSeconds = expireSeconds;
        this.prefix = prefix;
    }

}
