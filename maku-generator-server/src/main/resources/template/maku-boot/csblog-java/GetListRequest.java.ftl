package ${package}.request;

import com.codeshu.csblog.common.page.PageBaseRequest;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
* ${tableComment}分页列表请求入参
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Data
@EqualsAndHashCode(callSuper = false)
public class ${ClassName}GetListRequest extends PageBaseRequest implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("查询字段")
    private String testColumn;
}
