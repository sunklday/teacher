$(function(){
    $(".add-new-project").click(function(){
        window.location.href = "projectmanage/laoca/laoca-every-case.ftl";
    });

    $(".classify-manage").click(function(){
        window.location.href = "projectmanage/laoca/classify-manage.ftl";
    });

    initjqgrid("allcase");
    $(window).resize(function(){
        $("#list4").setGridWidth($("#anli").width());
    });
})

function initjqgrid(laocaselect) {
    jQuery("#list4").jqGrid({
        url:"words/read/"+laocaselect,
        datatype: "json",
        height: 'auto',
        autowidth:true,
        colNames:['序号','词库名称', '词库位置','介绍','操作'],
        colModel:[
            {name:'id',             index:'id',             align:"center",sortable: false, width:"50px",key:true,hidden:true},
            {name:'wordsFileName',          index:'wordsFileName',          align:"center",sortable: false, width:"100px" },
            {name:'filePath',          index:'filePath',          align:"center",sortable: false, width:"150px" },
            {name:'introduce',          index:'introduce',          align:"center",sortable: false, width:"350px" },
            {name:'edit',           index:'edit',           align:"center",sortable: false, width:"80px",formatter: cLink}
        ],
        jsonReader: {
            root: "rows",
            page: "page",
            total: "total",
            records: "records"
        },
        pager : '#gridpager',
        rowNum:20,
        rowList:[20],
        multiselect: false,
        viewrecords : true,
        rownumbers:true,
        caption: "词库管理"
    });
    jQuery("#list4").navGrid( '#gridpager', {edit : false,add : false,del : false,search:false});
    $("#jqgh_list4_rn").append("序号");
}
function cLink(cellvalue, options, rowObject) {
    var link ="/edit";
    var param = "wordsFileName";

    return "<a href ="+link+"?"+param+"="+encodeURI(rowObject.wordsFileName)+">编辑</a>";
}

$(".choes-click").click(function (){
    var index = $(".choes-click").index(this);
    console.log(index);
    if(index==0)
    {
        jQuery("#list4").jqGrid('setGridParam', {url:"projectmanage/laoca/read/allcase",page : 1}).trigger("reloadGrid");
        console.log(1)
    }
    else if(index==1)
    {
        jQuery("#list4").jqGrid('setGridParam', {url:"projectmanage/laoca/read/best",page : 1}).trigger("reloadGrid");
    }
    else if(index==2)
    {
        jQuery("#list4").jqGrid('setGridParam', {url:"projectmanage/laoca/read/history",page : 1}).trigger("reloadGrid");
        console.log(1)
    }
});