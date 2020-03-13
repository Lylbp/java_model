package ${basePackageController};

import ${basePackage}.core.result.ResResult;
import ${basePackage}.core.result.PageResResult;
import ${basePackage}.core.utils.ResResultUtil;
import ${basePackageModel}.${modelNameUpperCamel};
import ${basePackageService}.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: ${modelNameUpperCamel}Controller类
* @author ${author}
* @date ${date}
*/
@RestController
@RequestMapping("/${baseRequestMapping}")
public class ${modelNameUpperCamel}Controller {

    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping("/insert")
    public ResResult<Integer> insert(${modelNameUpperCamel} ${modelNameLowerCamel}){
        Integer count = ${modelNameLowerCamel}Service.insert(${modelNameLowerCamel});
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = ${modelNameLowerCamel}Service.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        Integer count = ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<${modelNameUpperCamel}> selectById(@RequestParam String id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.selectById(id);
        return ResResultUtil.success(${modelNameLowerCamel});
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<${modelNameUpperCamel}>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<${modelNameUpperCamel}>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}