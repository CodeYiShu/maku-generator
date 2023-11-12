package ${package}.service;

import ${package}.entity.${ClassName}Entity;
import ${package}.request.${ClassName}PageListRequest;
import com.codeshu.csblog.common.mybatis.common.MyIBaseService;

import java.util.List;

/**
 * ${tableComment} 业务逻辑层
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
public interface ${ClassName}Service extends MyIBaseService<${ClassName}Entity> {
   /**
   * 分页查询
   */
   List<${ClassName}Entity> pageList(${ClassName}PageListRequest request);
}
