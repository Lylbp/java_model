package com.lylbp.college.service;

import com.lylbp.college.entity.Area;
import com.lylbp.college.VO.AreaVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;
/**
 * <p>
 * 地址表 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
public interface AreaService extends IService<Area> {
        /**
         * 新增或编辑
         *
         * @param entity
         * @return
         */
        Boolean edit(Area entity);

        /**
         * 通过查询参数获取列表
         *
         * @param params 参数
         * @return
         */
        List<AreaVO> getAreaVOListByParams(Map<String, Object> params);

        /**
         * 通过查询参数获取单个AreaVO对象
         *
         * @param params 参数
         * @return
         */
        AreaVO getOneAreaVOByParams(Map<String, Object> params);

        /**
         * 通过字段名称与值获取单个AreaVO对象
         *
         * @param columnName 名称
         * @param columnValue 值
         * @return
         */
        AreaVO getOneAreaVOBy(String columnName, Object columnValue);

        /**
         * 通过主键判断是否存在
         *
         * @param id 主键
         * @return
         */
        Boolean isExist(String id);
}
