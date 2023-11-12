package ${package}.mapper;

import com.codeshu.csblog.common.mybatis.common.MyBaseMapper;
import ${package}.entity.${ClassName}Entity;
import ${package}.request.${ClassName}PageListRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
* ${tableComment} 数据库访问层
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Mapper
public interface ${ClassName}Mapper extends MyBaseMapper<${ClassName}Entity> {
    /**
    * 分页查询
    */
    List<${ClassName}Entity> pageList(@Param("request") ${ClassName}PageListRequest request);
}
