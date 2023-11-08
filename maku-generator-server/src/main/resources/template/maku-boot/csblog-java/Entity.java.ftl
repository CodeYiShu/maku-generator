package ${package}.${moduleName}.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.baomidou.mybatisplus.annotation.*;
import java.io.Serializable;
<#list importList as i>
import ${i!};
</#list>
<#if baseClass??>
import ${baseClass.packageName}.${baseClass.code};
</#if>

/**
 * ${tableComment}
 *
 * @author ${author} ${email}
 * @since ${version} ${date}
 */
<#if baseClass??>@EqualsAndHashCode(callSuper=false)</#if>
@Data
@TableName("${tableName}")
public class ${ClassName}Entity<#if baseClass??> extends ${baseClass.code}</#if> implements Serializable {
	private static final long serialVersionUID = 1L;

<#list fieldList as field>
<#if !field.baseField>
	<#if field.fieldComment!?length gt 0>
	/**
	* ${field.fieldComment}
	*/
	</#if>
	<#if field.attrName == "delFlag">
		@TableField(fill = FieldFill.INSERT)
	</#if>
    <#if field.primaryPk>
		@TableId(type = IdType.ASSIGN_ID)
	</#if>
	private ${field.attrType} ${field.attrName};
</#if>

</#list>
}
