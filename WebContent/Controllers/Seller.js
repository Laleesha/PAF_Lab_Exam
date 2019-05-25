function isValidFormSeller()
{
	if($.trim($("#txtSellerName").val())==""){
		return "Enter Seller Name";
		
		return "true/false";
	}
}


//Save/Update
$(document).on("click","#btnSave", function()
{
	var result = isValidFormSeller();
	if(result=="true")
	{ $("#formSellers").submit(); }
	else
	{ $("#divStsMsgItem").html(result); }
});

//Edit
$(document).on("click", "#btnEdit", function()
{
	$("#hidMode").val("update");
	$("#hidID").val($(this).attr("param"));
	$("#txtSellerName").val($(this).closest("tr").find('td.eq(1)').text());
	$("#txtSellerAddr").val($(this).closest("tr").find('td:eq(2)').text());
});

//Remove
$(document).on("click", "#btnRemove", function()
{
	$("#hidMode").val("remove");
	$("#hidID").val($(this).attr("param"));
	var res = confirm("Are you sure?");
	if (res == true) {
		$("#formSellers").submit();
	}
});S