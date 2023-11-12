package ${package}.service;

import ${package}.entity.${ClassName}Entity;
import ${package}.mapper.${ClassName}Mapper;
import ${package}.service.${ClassName}Service;
import ${package}.request.${ClassName}PageListRequest;
import com.codeshu.csblog.common.mybatis.common.MyBaseServiceImpl;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

import java.util.List;

/**
 * ${tableComment} 业务逻辑层
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
@Service
public class ${ClassName}ServiceImpl extends MyBaseServiceImpl<${ClassName}Mapper, ${ClassName}Entity> implements ${ClassName}Service {
    @Resource
    private ${ClassName}Mapper mapper;

    @Override
    public List<${ClassName}Entity> pageList(${ClassName}PageListRequest request) {
        return mapper.pageList(request);
    }
}
