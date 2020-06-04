package com.lylbp.college.core.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ResResult<T> {

    public int code;

    private String msg;

    private T data;
}
