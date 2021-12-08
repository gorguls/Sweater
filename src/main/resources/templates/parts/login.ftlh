<#macro login path isRegisterForm>
    <form action="/${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <label for="un" class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" placeholder="Имя пользователя" id="un"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="pw" class="col-sm-2 col-form-label">Password :</label>
            <div class="col-sm-6">
                <input type="password" name="password" placeholder="Пароль" id="pw"/>
            </div>
        </div>
        <#if isRegisterForm>
        <div class="form-group row">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-6">
                <input type="email" name="email" placeholder="some@some.com" id="email"/>
            </div>
        </div>
        </#if>
        <#if !isRegisterForm> <a href="/registration">Registration</a></#if>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm> Sign on <#else> Sign in </#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>