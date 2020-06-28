package com.wj.blog.service.impl;

import com.wj.blog.common.domain.Enclosure;
import com.wj.blog.common.domain.PageBean;
import com.wj.blog.dao.EnclosureMapper;
import com.wj.blog.service.EnclosureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class,readOnly = false,propagation = Propagation.REQUIRED)
public class EnclosureServiceImpl implements EnclosureService {

    @Autowired
    private EnclosureMapper enclosureMapper;


    /**
     * 添加一个附件
     * @param enclosure
     */
    @Override
    public void insert(Enclosure enclosure) {
        enclosureMapper.insert(enclosure);
    }

    @Override
    public PageBean<Enclosure> getEnclosureInfoData(int pc) {
        int ps = 56;
        PageBean<Enclosure> pageEnclosure = new PageBean<>();
        int start = (pc-1)*ps;
        List<Enclosure> enclosures = enclosureMapper.selectByDate(start,ps);
        //查询附件总数
        int tr = enclosureMapper.selectTotal();
        pageEnclosure.setListBean(enclosures);
        pageEnclosure.setPc(pc);
        pageEnclosure.setPs(ps);
        pageEnclosure.setTr(tr);
        return  pageEnclosure;
    }

    @Override
    public Enclosure getEnclosureById(Integer eId) {
        return enclosureMapper.selectByPrimaryKey(eId);
    }

    @Override
    public void deleteById(Integer eId) {
        enclosureMapper.deleteByPrimaryKey(eId);
    }
}
