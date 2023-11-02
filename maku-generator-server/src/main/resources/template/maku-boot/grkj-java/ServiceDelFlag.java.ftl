package ${package}.service;

import ${package}.entity.${ClassName};
import ${package}.mapper.${ClassName}Mapper;
import ${package}.request.${ClassName}GetListRequest;
import com.grkj.common.utils.MessagePageHelper;
import com.grkj.lib.page.entity.PageResponseMessage;
import com.grkj.lib.keyGenerator.KeyGenerator;
import com.grkj.modules.sys.utils.UserUtils;
import com.grkj.common.base2.impl.service.BaseMapperCurdService;
import com.grkj.common.enums.DelFlagEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

/**
 * ${tableComment} 业务逻辑层
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
public class ${ClassName}Service implements BaseMapperCurdService<${ClassName}> {
    @Autowired
    private ${ClassName}Mapper mapper;

    @Autowired
    private KeyGenerator<String> keyGenerator;

    @Override
    public Mapper<${ClassName}> getMapper() {
        return mapper;
    }

    @Override
    public boolean preInsert(${ClassName} data) {
        data.setId(keyGenerator.getNext());
        data.setDelFlag(DelFlagEnum.NO_DELETE.getCode());
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
        data.setDelFlag(DelFlagEnum.NO_DELETE.getCode());
        data.setUpdateTime(new Date());
        data.setUpdateUser(UserUtils.getUser().getName());
        return true;
    }

    @Override
    public Integer deleteById(Object id) {
        //逻辑删除
        ${ClassName} entity = mapper.selectByPrimaryKey(id);
        entity.setDelFlag(DelFlagEnum.HAS_DELETE.getCode());
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

    /**
     * 分页查询
     */
    public PageResponseMessage pageList(${ClassName}GetListRequest request) {
        //设置分页信息
        MessagePageHelper.startPage(request);
        List<${ClassName}> entityList = mapper.pageList(request);
        return MessagePageHelper.parseResult(entityList);
    }
}
