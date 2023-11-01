package ${package}.${moduleName}.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.persistence.Id;
import javax.persistence.Table;
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
@Table(name = "${tableName}", schema = "${connName}")
public class ${ClassName}<#if baseClass??> extends ${baseClass.code}</#if> implements Serializable {
	private static final long serialVersionUID = 1L;

<#list fieldList as field>
<#if !field.baseField>
	<#if field.fieldComment!?length gt 0>
	/**
	* ${field.fieldComment}
	*/
	</#if>
    <#if field.autoFill == "INSERT">
	@TableField(fill = FieldFill.INSERT)
	</#if>
	<#if field.autoFill == "INSERT_UPDATE">
	@TableField(fill = FieldFill.INSERT_UPDATE)
	</#if>
	<#if field.autoFill == "UPDATE">
		@TableField(fill = FieldFill.UPDATE)
	</#if>
    <#if field.primaryPk>
	@Id
	</#if>
	private ${field.attrType} ${field.attrName};
</#if>

</#list>
}
