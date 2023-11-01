package ${package}.controller;

import com.grkj.common.base.BaseRestfulController;
import com.grkj.common.base2.core.CurdService;
import com.grkj.lib.keyGenerator.KeyGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import ${package}.entity.${ClassName};
import ${package}.service.${ClassName}Service;

/**
* ${tableComment}
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
}
