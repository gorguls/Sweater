<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/main" method="get" class="form-inline">
                <input type="text" class="form-control" name="filter" placeholder="Поиск по тегу"
                       value="${filter?if_exists}">
                <button type="submit" class="btn btn-primary ml-2">Найти</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Добавить новое сообщение
    </a>
    <div class="collapse" id="collapse">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Введите сообщение">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Тэг">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Выберите файл</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary ml-2">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
        </div>
        <#else> "Нет сообщений"
        </#list>
    </div>
</@c.page>