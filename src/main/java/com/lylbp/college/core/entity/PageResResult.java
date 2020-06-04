package com.lylbp.college.core.entity;

import com.github.pagehelper.PageInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class PageResResult<T> {
    private List<T> data;
    private Integer pageNum;
    private Integer pageSize;
    private Long totalCount;

    public PageResResult(PageInfo pageInfo) {
        this.setData(pageInfo.getList());
        this.setPageSize(pageInfo.getPageSize());
        this.setPageNum(pageInfo.getPageNum());
        this.setTotalCount(pageInfo.getTotal());
    }
}
