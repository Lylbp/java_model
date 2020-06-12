package com.lylbp.college.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 地址表
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("area")
@ApiModel(value="Area对象", description="地址表")
public class Area extends Model<Area> {

    private static final long serialVersionUID=1L;

    @TableId(value = "area_id", type = IdType.ASSIGN_UUID)
    private String areaId;

    @ApiModelProperty(value = "父级id")
    @TableField("pid")
    private String pid;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Integer isValid;

    @ApiModelProperty(value = "名称")
    @TableField("name")
    private String name;


    @Override
    protected Serializable pkVal() {
        return this.areaId;
    }

}
