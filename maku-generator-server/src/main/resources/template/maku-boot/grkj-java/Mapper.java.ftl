package ${package}.dao;

import com.grkj.common.persistence.annotation.DBMapper;
import ${package}.entity.${ClassName};
import ${package}.request.${ClassName}GetListRequest;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
* ${tableComment} 数据库访问层
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@DBMapper
public interface ${ClassName}Mapper extends Mapper<${ClassName}> {
    /**
    * 分页列表
    */
    List<${ClassName}> pageList(@Param("request") ${ClassName}GetListRequest request);
}
