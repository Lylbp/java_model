package com.lylbp.college.core.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ResResult<T> {

    public int code;

    private String msg;

    private T data;
}
