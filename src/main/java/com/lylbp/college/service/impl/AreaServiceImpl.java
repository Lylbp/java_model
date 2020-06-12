package com.lylbp.college.service.impl;

import com.lylbp.college.entity.Area;
import com.lylbp.college.VO.AreaVO;
import com.lylbp.college.mapper.AreaMapper;
import com.lylbp.college.service.AreaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import cn.hutool.core.util.ObjectUtil;
import java.util.HashMap;
/**
 * <p>
 * 地址表 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@Service
public class AreaServiceImpl extends ServiceImpl<AreaMapper, Area> implements AreaService {
        @Override
        public Boolean edit(Area entity) {
            //TODO 新增或编辑之前需要进行的逻辑
            return saveOrUpdate(entity);
        }

        @Override
        public List<AreaVO> getAreaVOListByParams(Map<String, Object> params) {
            return getBaseMapper().queryAreaVOByParams(params);
        }

        @Override
        public AreaVO getOneAreaVOByParams(Map<String, Object> params) {
            AreaVO entityVO = null;
            List<AreaVO> list = getAreaVOListByParams(params);
            if (ObjectUtil.isNotEmpty(list)){
                entityVO = list.get(0);
            }

            return entityVO;
        }

        @Override
        public AreaVO getOneAreaVOBy(String columnName, Object columnValue){
            HashMap<String, Object> params = new HashMap<>();
            params.put(columnName, columnValue);

            return getOneAreaVOByParams(params);
        }

        @Override
        public Boolean isExist(String id) {
            return ObjectUtil.isNotEmpty(this.getById(id));
        }
}
