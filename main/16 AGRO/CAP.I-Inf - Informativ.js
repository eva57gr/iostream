var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f1_cap1_inf_16_agro();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f1_cap1_inf_16_agro();
    });
});


function f1_cap1_inf_16_agro() {

    //alert("test");

    var R0704_C1 = $("#36_384_78177_0704_1");
    var R0689_C1 = $("#36_384_78166_0689_1");
    var R0691_C1 = $("#36_384_78172_0691_1");
    var R0693_C1 = $("#36_384_78173_0693_1");
    var R0695_C1 = $("#36_384_78174_0695_1");
    var R0697_C1 = $("#36_384_78169_0697_1");
    var R0699_C1 = $("#36_384_78170_0699_1");
    var R0701_C1 = $("#36_384_78167_0701_1");
    var R0703_C1 = $("#36_384_78182_0703_1");
    
//Codul 0704 = Suma codurilor 0689 +0691 +0693 +0695 +0697 +0699 +0701 +0703                               
    //--------------readOnly input -----------------------

    R0704_C1.prop("readonly", true);
   
 


    //-------------------------------Rind 070------------------------------------------------------


    var values_0705 = [
       
        parseInt(R0689_C1.val()) || 0,
        parseInt(R0691_C1.val()) || 0,
        parseInt(R0693_C1.val()) || 0,
        parseInt(R0695_C1.val()) || 0,
        parseInt(R0697_C1.val()) || 0,
        parseInt(R0699_C1.val()) || 0,
        parseInt(R0701_C1.val()) || 0,
        parseInt(R0703_C1.val()) || 0
       
    ];

    // Calculate the sum of all values
    var sum = values_0705.reduce((acc, curr) => acc + curr, 0);

    // Set the value of R200_C1 to the calculated sum or an empty string if any input field is empty
    R0704_C1.val(sum === 0 ? "" : sum);


   


    
}

