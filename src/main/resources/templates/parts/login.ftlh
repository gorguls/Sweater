<#macro login path isRegisterForm>
    <form action="/${path}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <label for="un" class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-6">
                <input type="text"
                       name="username"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Имя пользователя"
                       value="<#if user??>${user.username}</#if>"
                       id="un"/>
                <#if usernameError??>
                    <div class=invalid-feedback>
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="pw" class="col-sm-2 col-form-label">Password :</label>
            <div class="col-sm-6 ">
                <input type="password"
                       name="password"
                       placeholder="Пароль"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       id="pw"/>
                <#if passwordError??>
                    <div class=invalid-feedback>
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row">
                <label for="pw" class="col-sm-2 col-form-label">Password 2:</label>
                <div class="col-sm-6 ">
                    <input type="password"
                           name="password2"
                           placeholder="Повторите пароль"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           id="pw"/>
                    <#if password2Error??>
                        <div class=invalid-feedback>
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input type="email"
                           name="email"
                           placeholder="some@some.com"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           value="<#if user??>${user.email}</#if>"
                           id="email"/>
                    <#if emailError??>
                        <div class=invalid-feedback>
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
            <div class="form-group row">
                <button type="submit" class="btn btn-primary"><#if isRegisterForm> Sign on <#else> Sign in </#if></button>
            </div>
        <div class="form-group row">
            <#if !isRegisterForm> <a href="/registration">Registration</a></#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>