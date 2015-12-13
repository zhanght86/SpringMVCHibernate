$(document).ready(function(){

    $(".faq .item .title").click(function(){
        var text = $(this).parent('.item').find('.text');
        
        if(text.is(':visible'))
            text.fadeOut();
        else
            text.fadeIn();                
    });

    $("#faqSearch").click(function(){
        var keyword = $(".faqSearchKeyword").val();
        
        if(keyword.length >= 2){
/*          $(".faq").find('.text').fadeOut();
            $("#faqSearchResult").html("");
            $(".faq").removeHighlight();
            
            var items = $(".faq .item:containsi('"+keyword+"')").find('.text');
            items.highlight(keyword);
            items.fadeIn();            
            $("#faqSearchResult").html(items.length+" matches"); */           
            
        }else
            $("#faqSearchResult").html("<span style='color: red;'>最少2个字符</span>");
         
    });
    
    $("#faqListController a").click(function(){
        var open = $(this).attr('href');
        $(open).find('.text').fadeIn();
    });
    
    $("#faqOpenAll").click(function(){
        $(".faq").find('.text').fadeIn();
    });
    
    $("#faqCloseAll").click(function(){
        $(".faq").find('.text').fadeOut();
    });
    
    $("#faqRemoveHighlights").click(function(){
        $(".faq").removeHighlight();
    });
    
    
    
});
function pm_knowledge_highlight(keyword)
{
	$(".faq").find('.text').fadeOut();
    $("#faqSearchResult").html("");
    $(".faq").removeHighlight();
    
    var items = $(".faq .item:containsi('"+keyword+"')").find('.text');
    items.highlight(keyword);
    items.fadeIn();            
    $("#faqSearchResult").html("查询到 " + items.length+" 项 知识");	
}
function pm_knowledge_initdialog()
{
    // 知识库
	$("#b_popup_knowledge").html("<iframe src='"+ctx+"/knowledge/searchdialog' width='100%' height='500' frameborder='0'/>");
    $("#b_popup_knowledge").dialog({
        autoOpen: false,
        width: 1200,
        buttons: { "关闭": function () { $(this).dialog("close") } },
        open: function () { $("#scroll_knowledge").mCustomScrollbar(); }
    });
    $("#lnk_knowledge").click(function () {
    	$("#b_popup_knowledge").dialog('open');
    });
}
function pm_knowledge_initdialog(type,id)
{
    // 知识库
	$("#b_popup_knowledge").html("<iframe src='"+ctx+"/knowledge/searchdialog?type="+type+"&id="+id+"' width='100%' height='500' frameborder='0'/>");
    $("#b_popup_knowledge").dialog({
        autoOpen: false,
        width: 1200,
        buttons: { "关闭": function () { $(this).dialog("close") } },
        open: function () { $("#scroll_knowledge").mCustomScrollbar(); }
    });
    $("#lnk_knowledge").click(function () {
    	$("#b_popup_knowledge").dialog('open');
    });
}