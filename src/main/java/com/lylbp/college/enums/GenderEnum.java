package com.lylbp.college.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import com.lylbp.college.core.entity.LabelVO;
import com.lylbp.college.core.interfaces.IBaseEnum;
import lombok.Getter;

import java.util.Arrays;


/**
 * @Author weiwenbin
 * @Date 2020/6/4 上午8:49
 */
@Getter
public enum GenderEnum implements IBaseEnum<String> {
    MALE("1", "男"),
    WOMAN("2", "女");
    @EnumValue
    private final String code;

    private final String name;

    @JsonValue
    private final LabelVO labelVO;

    GenderEnum(String code, String name) {
        this.code = code;
        this.name = name;
        this.labelVO = new LabelVO(code, name);
    }

    public static String getByCode(String pCode) {
        GenderEnum trueOrFalseEnum = Arrays.stream(GenderEnum.values()).filter(item -> {
            return item.getCode().equals(pCode);
        }).findFirst().orElse(null);
        return null != trueOrFalseEnum ? trueOrFalseEnum.getName() : "";
    }

    public static GenderEnum getEnumByCode(String pCode) {
        return Arrays.stream(GenderEnum.values()).filter(item -> {
            return item.getCode().equals(pCode);
        }).findFirst().orElse(null);
    }

    @Override
    public String getValue() {
        return code;
    }
}
