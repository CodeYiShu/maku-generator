package ${package}.mapper;

import com.codeshu.csblog.common.mybatis.common.MyBaseMapper;
import ${package}.entity.${ClassName}Entity;
import org.apache.ibatis.annotations.Mapper;


/**
* ${tableComment} 数据库访问层
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Mapper
public interface ${ClassName}Mapper extends MyBaseMapper<${ClassName}Entity> {

}
