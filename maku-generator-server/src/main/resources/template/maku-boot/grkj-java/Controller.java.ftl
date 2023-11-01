package ${package}.controller;

import com.grkj.common.base.BaseRestfulController;
import com.grkj.common.base2.core.CurdService;
import com.grkj.lib.keyGenerator.KeyGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.GetMapping;
import com.grkj.lib.message.entity.ResponseMessage;
import com.grkj.lib.page.entity.PageResponseMessage;
import ${package}.entity.${ClassName};
import ${package}.service.${ClassName}Service;
import ${package}.request.${ClassName}GetListRequest;

/**
* ${tableComment} 控制层
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@Controller
@Api(tags = "${tableComment}")
@RequestMapping("${requestMapping}")
public class ${ClassName}Controller implements BaseRestfulController<${ClassName}> {
    @Autowired
    private KeyGenerator<String> keyGenerator;
    @Autowired
    private ${ClassName}Service service;

    @Override
    public void checkKey(${ClassName} data) {
        if (data.getId() == null || "".equals(data.getId())) {
            data.setId(keyGenerator.getNext());
        }
    }

    @Override
    public CurdService<${ClassName}> getService() {
        return service;
    }

    @ApiOperation("分页查询")
    @GetMapping(value = "/pageList", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public ResponseMessage pageList(${ClassName}GetListRequest request) {
        PageResponseMessage responseMessage = service.pageList(request);
        return ResponseMessage.newOkInstance(responseMessage);
    }
}
