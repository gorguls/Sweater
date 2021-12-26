<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    ${message?if_exists}
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXEPTION??>
       <div class="alert alert-danger" role="alert">
           ${Session.SPRING_SECURITY_LAST_EXEPTION.message}
       </div>
    </#if>
    <@l.login "login" false />
</@c.page>