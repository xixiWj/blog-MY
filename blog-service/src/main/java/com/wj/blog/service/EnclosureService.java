package com.wj.blog.service;

import com.wj.blog.common.domain.Enclosure;
import com.wj.blog.common.domain.PageBean;

public interface EnclosureService {
    void insert(Enclosure enclosure);

    PageBean<Enclosure> getEnclosureInfoData(int pc);

    Enclosure getEnclosureById(Integer eId);

    void deleteById(Integer eId);
}
