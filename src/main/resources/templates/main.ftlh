<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div>
        <@l.logout />
        <span><a href="/user">Список пользователей</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type="text" name="tag" placeholder="Тэг">
            <input type="file" name="file">
            <button type="submit">Добавить</button>
        </form>

    </div>
    <div>Список сообщений</div>
    <form action="/main" method="get">
        <input type="text" name="filter" value="${filter?if_exists}">
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
        <div>
            <p>
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
                <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                <img src="/img/${message.filename}">
                </#if>
            </div>
            </p>
        </div>
    <#else> "Нет сообщений"
    </#list>
</@c.page>