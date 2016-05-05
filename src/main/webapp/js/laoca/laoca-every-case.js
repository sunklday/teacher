
/*提交表单*/
$('#save-button').on('click', function () {
    var wordsFileName = $("#wordsFileName").val(),

        introduce = $("#introduce").val();
    $(this).ajaxSubmit({
        type: 'post', // 提交方式 get/post
        url: '/words/add/add', // 需要提交的 url
        data: {
            'wordsFileName': wordsFileName,
            'introduce': introduce,

        },
        success: function (data) { // data 保存提交后返回的数据，一般为 json 数据
            alert('提交成功！');

        }
    });
});
