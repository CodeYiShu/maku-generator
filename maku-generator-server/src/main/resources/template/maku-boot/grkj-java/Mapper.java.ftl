package ${package}.dao;

import com.grkj.common.persistence.annotation.DBMapper;
import ${package}.entity.${ClassName};
import tk.mybatis.mapper.common.Mapper;

/**
* ${tableComment}
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@DBMapper
public interface ${ClassName}Mapper extends Mapper<${ClassName}> {

}
