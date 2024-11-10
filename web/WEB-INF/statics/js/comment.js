//点击小图片，显示表情
$(".bq").click(function (e) {
    $(".face").slideDown(); //慢慢向下展开
    e.stopPropagation(); //阻止冒泡事件
});

//在桌面任意地方点击，关闭表情框
$(document).click(function () {
    $(".face").slideUp(); //慢慢向上收
});

//点击小图标时，添加功能
$(".face ul li").click(function () {
    let simg = $(this).find("img").clone();
    // $(".commentTextarea").append(simg); //将表情添加到输入框
    // $(".commentTextarea").html(simg);
    // $(".commentTextarea").value=simg;
    document.getElementById("commentTextarea").value+=simg;
});

























