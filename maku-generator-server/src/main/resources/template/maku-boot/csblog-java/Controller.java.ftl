package ${package}.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import ${package}.service.${ClassName}Service;

/**
* ${tableComment} 控制层
*
* @author ${author} ${email}
* @since ${version} ${date}
*/
@RestController
@Api(tags = "${tableComment}")
@RequestMapping("${requestMapping}")
public class ${ClassName}Controller {
    @Autowired
    private ${ClassName}Service service;
}
