<#import "parts/common.ftlh" as c>
<@c.page>
    Список пользователей
    <table>
        <thead>
        <tr>
            <th>Имя</th>
            <th>Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th>${user.username!}</th>
                <th><#list user.roles as role> ${role!} <#sep >, </#list> </th>
                <th><a href="/user/${user.id!}">Изменить</a></th>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>