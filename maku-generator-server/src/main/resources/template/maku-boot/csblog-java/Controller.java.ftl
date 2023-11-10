package ${package}.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.codeshu.csblog.common.Result;

import java.util.List;

import ${package}.entity.${ClassName}Entity;
import ${package}.service.${ClassName}Service;
import ${package}.request.${ClassName}GetListRequest;

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

    @GetMapping("/getAll")
    @ApiOperation("查询所有")
    public Result getAll(${ClassName}GetListRequest request) {
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<${ClassName}Entity> entityList = service.list();
        PageInfo<${ClassName}Entity> page = new PageInfo<>(entityList);
        return Result.success(page);
    }

    @GetMapping("/getById")
    @ApiOperation("根据id查询")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "id", value = "主键"),
    })
    public Result getById(@RequestParam Long id) {
        ${ClassName}Entity entity = service.getById(id);
        return Result.success(entity);
    }

    @PostMapping("/save")
    @ApiOperation("添加")
    public Result save(@RequestBody ${ClassName}Entity entity) {
        boolean count = service.save(entity);
        if (count) {
            return Result.success("新增成功", null);
        } else {
            return Result.fail("新增失败");
        }
    }

    @PostMapping("/updateById")
    @ApiOperation("根据id更新")
    public Result updateById(@RequestBody ${ClassName}Entity entity) {
        boolean count = service.updateById(entity);
        if (count) {
            return Result.success("修改成功", null);
        } else {
            return Result.fail("修改失败");
        }
    }

    @GetMapping("/removeById")
    @ApiImplicitParams({
    @ApiImplicitParam(name = "id", value = "主键"),
    })
    @ApiOperation("根据id删除")
    public Result removeById(Long id) {
        boolean count = service.removeById(id);
        if (count) {
            return Result.success("删除成功", null);
        } else {
            return Result.fail("删除失败");
        }
    }
}
