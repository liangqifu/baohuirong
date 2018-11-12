package com.enterprise.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.enterprise.dao.BaseDao;
import com.enterprise.dao.DictDao;
import com.enterprise.entity.Dict;
import com.enterprise.entity.page.PageModel;

/**
 * Created by Cesiumai on 2016/7/8.
 */
@Repository("dictDao")
public class DictDaoImpl implements DictDao {
    @Resource
    private BaseDao dao;

    public void setDao(BaseDao dao) {
        this.dao = dao;
    }

    @Override
    public int insert(Dict dict) {
        return dao.insert("dict.insert",dict);
    }

    @Override
    public int delete(Dict dict) {
        return 0;
    }

    @Override
    public int update(Dict dict) {
        return dao.delete("dict.update",dict);
    }

    @Override
    public Dict selectOne(Dict dict) {
        return (Dict) dao.selectOne("dict.selectOne",dict);
    }

    @Override
    public PageModel selectPageList(Dict dict) {
        return dao.selectPageList("dict.selectPageList","dict.selectPageCount",dict);
    }

    @Override
    public List<Dict> selectList(Dict dict) {
        return dao.selectList("dict.selectList",dict);
    }

    @Override
    public int deleteById(int id) {
        return dao.delete("dict.deleteById",id);
    }

    @Override
    public Dict selectById(int id) {
        return (Dict) dao.selectOne("dict.selectById",id);
    }
}
