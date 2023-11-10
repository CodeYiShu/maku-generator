<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${package}.dao.${ClassName}Mapper">

    <resultMap type="${package}.entity.${ClassName}" id="${className}Map">
        <#list fieldList as field>
            <result property="${field.attrName}" column="${field.fieldName}"/>
        </#list>
    </resultMap>

    <select id="pageList" resultType="${package}.entity.${ClassName}">
        SELECT * FROM ${connName}.${tableName}
        <where>
            DEL_FLAG = 0
        </where>
    </select>
</mapper>
