package ${package}.service;

import ${package}.entity.${ClassName};
import ${package}.mapper.${ClassName}Mapper;
import com.grkj.lib.keyGenerator.KeyGenerator;
import com.grkj.modules.sys.utils.UserUtils;
import com.grkj.common.base2.impl.service.BaseMapperCurdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
public class ${ClassName}Service implements BaseMapperCurdService<${ClassName}> {
    @Autowired
    private EquipSonMapper mapper;

    @Autowired
    private KeyGenerator<String> keyGenerator;

    @Override
    public Mapper<${ClassName}> getMapper() {
        return mapper;
    }

    @Override
    public boolean preInsert(${ClassName} data) {
        data.setId(keyGenerator.getNext());
        data.setDelFlag("0");
        data.setCreateTime(new Date());
        data.setCreateUser(UserUtils.getUser().getName());
        data.setUpdateTime(new Date());
        data.setUpdateUser(UserUtils.getUser().getName());
        return true;
    }

    @Override
    public boolean preUpdate(${ClassName} data) {
        ${ClassName} dbData = mapper.selectByPrimaryKey(data.getId());
        data.setCreateUser(dbData.getCreateUser());
        data.setCreateTime(dbData.getCreateTime());
        data.setDelFlag("0");
        data.setUpdateTime(new Date());
        data.setUpdateUser(UserUtils.getUser().getName());
        return true;
    }

    @Override
    public Integer deleteById(Object id) {
        //逻辑删除
        ${ClassName} entity = mapper.selectByPrimaryKey(id);
        entity.setDelFlag("1");
        entity.setUpdateTime(new Date());
        entity.setUpdateUser(UserUtils.getUser().getName());
        int result = 0;
        if (preDelete(id)) {
            //更新 delFlag 字段为 1
            result = mapper.updateByPrimaryKeySelective(entity);
            afterDelete(id);
        }
        return result;
    }
}
