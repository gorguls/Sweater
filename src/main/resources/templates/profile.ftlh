<#import "parts/common.ftlh" as c>
<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <form method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <label for="pw" class="col-sm-2 col-form-label">Password :</label>
            <div class="col-sm-6">
                <input type="password" name="password" placeholder="Пароль" id="pw"/>
            </div>
        </div>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input type="email" name="email" placeholder="some@some.com" id="email" value="${email!' '}"/>
                </div>
            </div>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>