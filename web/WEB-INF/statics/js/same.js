window.onload = function () {
    var OriginTitile = document.title;
    var titleTime;
    document.addEventListener("visibilitychange", function () {
        if (document.hidden) {
            $('[rel="icon"]').attr("href", "/statics/images/same/renIcon2.png");
            document.title = "(●—●)人呢，快回来！";
            clearTimeout(titleTime);
        }
        else {
            $('[rel="icon"]').attr("href", "/statics/images/same/renIcon2.png");
            document.title = "(/≧▽≦/)我回来咯~" +OriginTitile;
            titleTime =setTimeout(function () {
                document.title =OriginTitile;
            }, 2000);
        }
    });
}