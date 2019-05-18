$(function(){
    /*var user=isNaN(parseInt($("input").val()));*/
    var user=$(".in").val();
    var flag=0;
    //flag为0，无用户，有用户
    if(user === 'true'){
        flag=0;
        $("a").eq(2).removeAttr("href");
        $("a").eq(2).attr("href","javascript:alert('请先登录');");
        return flag;
    }else if(user === 'false'){
        flag = 1;
        $("a").eq(2).removeAttr("href");
        $("a").eq(2).attr("href","../a/topic1.jsp");
        return flag;
    }else{
        console.log('用户错误');
    }
});