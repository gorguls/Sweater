<#import "parts/common.ftlh" as c>
<@c.page>
    Управление пользователем
    <form action="/user" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="text" name="username" value="${user.username}"/>
        <input type="hidden" name="userId" value="${user.id}"/>
        <#list roles as role>
            <div>
               <label>  <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <button type="submit">Сохранить</button>
    </form>
</@c.page>