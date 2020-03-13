package com.dar.road.core.result;

import com.github.pagehelper.PageInfo;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@NoArgsConstructor
@Data
public class PageResResult<T> {
    private List<T> Data;
    private Integer PageNum;
    private Integer PageSize;
    private Long TotalCount;

    public PageResResult(PageInfo pageInfo) {
        this.setData(pageInfo.getList());
        this.setPageSize(pageInfo.getPageSize());
        this.setPageNum(pageInfo.getPageNum());
        this.setTotalCount(pageInfo.getTotal());
    }
}
