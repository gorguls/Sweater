<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <p>Add new user</p>
    ${message}
    <@l.login "registration" />
</@c.page>