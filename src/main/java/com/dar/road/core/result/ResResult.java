package com.dar.road.core.result;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ResResult<T> {

    public int code;

    private String msg;

    private T data;
}
