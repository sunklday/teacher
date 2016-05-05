
$(function(){

    //菜单消失/出现效果
    $(".menu-same-style").click(function(){
        $(this).next().slideToggle();
    });

    //第一次进入只加载平台数据的div
    $(".formwork-hide").hide();
    $(".overall-date").hide();


    var containH = $('.hj-container').height();
    //屏幕尺寸适配折线图表
    var windH = $(window).height();
    var screenW = $(window).width();
    if(windH < containH){
        //菜单and主体内容div高度
        $(".menu").css("height",containH);
        $(".hj-container").css("height",containH);
    }else{
        //菜单and主体内容div高度
        $(".menu").css("height",windH - 55);
        $(".hj-container").css("height",windH - 55);
    }




    //字体大小 动画效果
    $(".choes-click").click(function(){
        $(".choes-click").removeClass('size-big');
        $(this).addClass("size-big");
    });

});