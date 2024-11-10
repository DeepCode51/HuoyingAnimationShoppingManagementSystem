//常见验证码
function createCode(){
    //创建随机4位数字，math.floor向下取整
    var code=Math.floor(Math.random()*9000+1000);
    //获取元素对象
    var  span=document.getElementById("codeSpan");
    //将数字存放到span中
    span.innerHTML=code;
    //给span添加背景图片
}
//验证用户名
function checkUname(){
    //获取用户获得用户名信息
    var uname=document.getElementById("username").value;
    //创建校验规则,用户名1-8个汉字
    var reg=/^[\u4e00-\u9fa5]{1,8}$/
    //获取span对象
    var usernameSpan=document.getElementById("usernameSpan");
    //开始交验
    if(usernameSpan==""||usernameSpan==null){
        //输入校验结果
        usernameSpan.innerHTML="*用户名不能为空,可以为1-8位汉字";
        usernameSpan.style.color="red";
        return false;
    }else if(reg.test(uname)){
        //输入校验结果
        usernameSpan.innerHTML="*用户名格式通过";
        usernameSpan.style.color="green";
        return true;
    }else{
        //输入校验结果
        usernameSpan.innerHTML="*用户名格式不符,可以为1-8位汉字"
        usernameSpan.style.color="red";
        return false;
    }

}
//验证密码
function checkPwd(){
    //获取用户获得用户名信息
    var upwd=document.getElementById("pwd").value;
    //创建校验规则,密码要求6-8位，首位为字母
    // var reg=/^[a-z]\w{5,7}$/;
    //创建校验规则,密码要求6-16位，首位为字母,可带数字、“.”、“_”、“/”、“!”的字串
    var reg=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._/!]){5,15}$/;
    //获取span对象
    var span=document.getElementById("pwdSpan");
    //开始交验
    if(span==""||span==null){
        //输入校验结果
        span.innerHTML="*密码不能为空";
        span.style.color="red";
        return false;
    }else if(reg.test(upwd)){
        //输入校验结果
        span.innerHTML="*密码格式通过";
        span.style.color="green";
        return true;
    }else{
        //输入校验结果
        span.innerHTML="*密码要求6-16位，首位为字母,可带数字、“.”、“_”、“/”、“!”的字串"
        span.style.color="red";
        return false;
    }
    //第一次密码为a123456，第二次密码为a1234567，则修改的第一次密码，确认密码也会重新校验
    checkPwd2();
}
//校验确认密码
function checkPwd2(){
    //创建校验规则,密码要求6-16位，首位为字母,可带数字、“.”、“_”、“/”、“!”的字串
    var reg=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._/!]){5,15}$/;
    //获取第一次校验密码
    var pwd=document.getElementById("pwd").value;
    //获取确认密码
    var pwd2=document.getElementById("pwd2").value;
    //获取span对象
    var span=document.getElementById("pwd2Span");
    //比较前两次密码是否相同
    if( pwd2==""|| pwd2==null){
        //输入校验结果
        span.innerHTML="*密码不能为空";
        span.style.color="red";
        return false;
    } else if(pwd!=pwd2){
        //输入校验结果
        span.innerHTML="*密码不同，请重新输入"
        span.style.color="red";
        return false;
    }
    else if (!reg.test(pwd2)) {
        //输入校验结果
        span.innerHTML = "*密码格式不符"
        span.style.color = "red";
        return false;
    }else{
        //输入校验结果
        span.innerHTML="*密码通过";
        span.style.color="green";
        return true;
    }
    // else if(pwd===pwd2){
    //     //输入校验结果
    //     span.innerHTML="*密码通过";
    //     span.style.color="green";
    //     return true;
    // }
    // else{
    //     //输入校验结果
    //     span.innerHTML="*密码不同，请重新输入"
    //     span.style.color="red";
    //     return false;
    // }
}
//验证用户名
function checkAge(){
    //获取用户获得年龄信息
    var uage=document.getElementById("age").value;
    //创建校验规则,密码要求6-16位，首位为字母,可带数字、“.”、“_”、“/”、“!”的字串
    // var reg=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._/!]){5,15}$/;
    //创建校验规则,年龄0-999
    var reg=/^[0-9]{1,3}$/
    //获取span对象
    var ageSpan=document.getElementById("ageSpan");
    //开始交验
    if(ageSpan==""||ageSpan==null){
        //输入校验结果
        ageSpan.innerHTML="*年龄不能为空,为0-999的整数";
        ageSpan.style.color="red";
        return false;
    }else if(reg.test(uage)){
        //输入校验结果
        ageSpan.innerHTML="*年龄格式通过";
        ageSpan.style.color="green";
        return true;
    }else{
        //输入校验结果
        ageSpan.innerHTML="*年龄格式不符,为0-999的整数"
        ageSpan.style.color="red";
        return false;
    }

}
//校验手机号
function checkPhone(){
    return checkField("phone",/^1[3456789]\d{9}$/);
}
//校验邮箱
function checkmail(){
    return checkField("mail",/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)
}
//校验籍贯
function checkAddress(){
    //获取用户选择的数据
    var sel=document.getElementById("address").value;
    //获取span
    var span=document.getElementById("addressSpan");
    //校验，只要不为value="0"即可
    if(sel!=0){
        span.innerHTML="籍贯选择成功";
        span.style.color="green";
        return true;
    }else{
        span.innerHTML="请选择籍贯";
        span.style.color="red";
        return false;
    }
}
//校验爱好选择
function checkFav(){
    //获取所有的爱好
    var favs=document.getElementsByName("fav");
    //获取span对象
    var span=document.getElementById("favSpan");
    //遍历
    for(var i=0;i<favs.length;i++){
        if(favs[i].checked){
            span.innerHTML="*爱好通过";
            span.style.color="green";
            return true;
        }
    }
    //这段代码一直会被执行，所以当选择过爱好后，直接return结束即可
    span.innerHTML="爱好至少选择一项";
    span.style.color="red";
    return false;
}
//校验确认验证码------------------
function checkCode(){
    //获取用户输入验证码
    var code=document.getElementById("code").value;
    //获取随机验证码
    var code2=document.getElementById("codeSpan").innerHTML;
    //获取span对象
    var span=document.getElementById("codeSpan2");
    //比较前两次密码是否相同
    if( code==""|| code==null){
        //输入校验结果
        span.innerHTML="*验证码不能为空";
        span.style.color="red";
        // createCode();
        return false;
    }else if(code==code2){
        //输入校验结果
        span.innerHTML="*验证码通过";
        span.style.color="green";
        return true;
    }else{
        //输入校验结果
        span.innerHTML="*验证码错误"
        span.style.color="red";
        // createCode();
        return false;
    }
    return true;
}
//校验是否同意公司协议，注册提交判断
function checkAgree(){
//							//获取提交按钮的disable属性,选中框后disabled的值为1.
//							alert(document.getElementById("sub").disabled);
//     document.getElementById("sub").disabled=!document.getElementById("agree").checked;
    if (checkUname()&& checkPwd()&& checkPwd2()&&checkCode()){
        document.getElementById("sub").disabled=!document.getElementById("agree").checked;
    }
}
function checkLoginAgree(){
    if (checkUname()&& checkPwd()&&checkCode()){
        document.getElementById("sub").disabled=!document.getElementById("agree").checked;
    }
}

//提交判断
function checkSub(){
    checkUname();
    checkPwd();
    checkPwd2();
    checkmail();
    checkPhone();
    checkFav();
    checkAddress();
    checkCode();
    // checkLoginAgree();
    return checkUname()&&checkPwd()&&checkPwd2()&&checkmail()&&checkPhone()&&checkFav()&&checkAddress()&&checkCode();
}
//----------------------------------------------------------------------------------------------------------------------
//封装校验：相同的保留，不同的传参
function checkField(id,reg){
    //获取用户数据
    var inp=document.getElementById(id);
    var	va=inp.value;
    var	alt=inp.alt;
    //创建校验规则
    //获取span对象
    var span=document.getElementById(id+"Span");
    //开始校验
    if(va==""||va==null){
        //输入校验结果
        span.innerHTML="*"+alt+"不能为空";
        span.style.color="red";
        return false;
    }else if(reg.test(va)){
        //输入校验结果
        span.innerHTML="*"+alt+"通过";
        span.style.color="green";
        return true;
    }else{
        //输入校验结果
        span.innerHTML="*"+alt+"格式不符";
        span.style.color="red";
        return false;
    }
}
